module Interpreter where

import AbsRomeo 
import Control.Monad.State
import Control.Monad.Reader
--import Control.Monad.Writer
--import Control.Monad.Except
import Data.Map (Map)
import qualified Data.Map as Map
import LexRomeo
import ParRomeo
import ErrM

data Value a
    = VInt Int 
    | VBool Bool 
    | VString String 
    | VList [Value a]
    | VGen Ident Int
    | VFun [Ident] [Stmt a] Env -- function consists of arguments, body and environment
                             -- arguments are the names of the arguments
                             -- body is the body of the function (a statements to be executed)
                             -- environment is the environment in which the function was defined
                             --  
    deriving (Eq)
-- define show for Value
instance Show (Value a) where
    show (VInt n) = show n
    show (VBool b) = show b
    show (VString s) = show s
    show (VList l) = show l
    show (VFun args body env) = "Function"-- ++ show args ++ " " ++ show body ++ " " ++ show env

type Loc = Int
type Env = Map Ident Loc
type Store a = (Loc, Map Loc (Value a))


data ReturnType a = Return (Value a) -- return from a function
    | BreakLoop  -- break out of a loop
    | Continue -- continue to the next iteration of a loop
    | Yield (Value a) (ReaderT Env (StateT (Store a) IO) (ReturnType a))
    | Pass -- do nothing


retToVal :: ReturnType a -> Value a
retToVal v = case v of
                Return (VInt l) -> VInt l
                _ -> error "Type error"

retToInt :: ReturnType a -> Int
retToInt v = case v of
                Return (VInt l) -> l
                _ -> error "Type error"

printRet :: ReturnType a -> ReaderT Env (StateT (Store a) IO) (ReturnType a)
printRet ret = do 
    case ret of 
        Return val -> do 
            liftIO $ print val
            return Pass 
        Pass -> do 
            liftIO $ print "pass"
            return Pass 
        Continue -> do
            liftIO $ print "continue"
            return Pass 
        BreakLoop -> do 
            liftIO $ print "BreakLoop"
            return Pass


alloc :: ReaderT Env (StateT (Store a) IO) (ReturnType a)
alloc = do
    (loc, store) <- get
    put (loc + 1, store)
    return $ Return (VInt loc)


insert :: Loc -> Value a -> ReaderT Env (StateT (Store a) IO) (ReturnType a)
insert loc val = do
    (maxloc, store) <- get
    if loc > maxloc
        then put (loc, Map.insert loc val store)
        else put (maxloc, Map.insert loc val store)
    return $ Return val

---------------------------------------------- Eval expressions ----------------------------------------------

--evalExp :: Env -> Store -> Expr -> Value
evalExp :: (Show a) => (Expr a) -> ReaderT Env (StateT (Store a) IO) (ReturnType a)
evalExp  (EVar _ x) = do
    env <- ask -- get the environment from the reader
    case Map.lookup x env of -- look up the variable in the environment
        Just loc -> do -- if the variable is found
            (_, store) <- get -- get the store from the state
            case Map.lookup loc store of
                Just val -> return $ Return val -- return the value of the variable
                Nothing -> do
                    error "Variable not found"
        Nothing -> error "Variable not found"

evalExp (ELitInt _ n) = return $ Return (VInt (fromIntegral n))

evalExp (ELitLis _ (Lis1 _ exps)) = do
    --vals <- mapM (evalExp) exps
    rets <- mapM (evalExp) exps
    let vals = map (\ret -> case ret of
                              Return v -> v
                              _ -> error "Type error: expected Return") rets
    return $ Return (VList vals)

evalExp (ELitLis _ (Lis2 _ exp1 exp2)) = do
    --val1 <- evalExp  exp1
    --val2 <- evalExp  exp2
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VInt start, VInt stop) -> return $ Return $ VList [VInt n | n <- [start..stop]]
        _ -> error "Type error"
    
evalExp  (ELitLis _ (Lis3 _ exp iter start stop)) = do
    startret <- evalExp start
    stopret <- evalExp stop
    let (startval, stopval) = case (startret, stopret) of
                                (Return v1, Return v2) -> (v1, v2)
                                _ -> error "Type error: expected Return"
    case (startval, stopval) of
        (VInt start, VInt stop) -> do
            env <- ask
            store <- get
            r <- alloc
            let iterloc = retToInt r
            let env' = Map.insert iter iterloc env
            local (const env') $ do
                put store
                let iterVals = [VInt n | n <- [start..stop]]
                vals <- mapM (\val -> do
                                (_, s)<- get
                                put $ (iterloc, Map.insert iterloc val s)
                                ret <- evalExp exp
                                case ret of
                                    Return v -> return v
                                    _ -> error "Type error") iterVals
                return $ Return $ VList vals 
        _ -> error "Type error"

evalExp (ELitLis _ (Lis4 _ exp iter lis)) = do
    env <- ask
    store <- get
    let val = getValue lis env store
    retloc <- alloc
    let iterloc = retToInt retloc
    case val of
        VList l -> do
            let env' =  Map.insert iter iterloc env
            local (const env') $ do
                vals <- mapM (\val -> do
                                (maxloc, s) <- get
                                put $ (maxloc, Map.insert iterloc val s)
                                ret <- evalExp exp
                                case ret of
                                    Return v -> return v
                                    _ -> error "Type error") l
                return $ Return $ VList vals
        _ -> error "Type error"


evalExp (ELitTrue _) = return $ Return (VBool True)

evalExp (ELitFalse _) = return $ Return (VBool False)

evalExp (EApp _ f exps) = do
    env <- ask
    --liftIO $ print env
    --liftIO $ print f
    case Map.lookup f env of
        Just loc -> do
            --liftIO $ print loc
            (maxloc, store) <- get
            --liftIO $ print store
            case Map.lookup loc store of
                Just (VFun args body env') -> do
                    if length args /= length exps
                        then error "Incorrect number of arguments"
                    else do
                        rets <- mapM (evalExp) exps
                        let argvals = map (\ret -> case ret of
                              Return v -> v
                              _ -> error "Type error: expected Return") rets
                        let locs = [(maxloc + 1)..(maxloc + length args)] -- get the locations for the arguments
                        let argslocs = zip args locs -- zip the arguments with their locations
                        let envarg = foldl (\accEnv (arg, l) -> Map.insert arg l accEnv) env' argslocs -- create a new environment with the arguments in which the function will be run
                        let store' = foldl (\store (loc, val) -> Map.insert loc val store) store (zip locs argvals)
                        --liftIO $ print store'
                        put (maxloc + length args + 1, store')
                        local (const envarg) $ do
                            ret <- evalStmts body
                            case ret of
                                Return val -> return $ Return val
                                Yield  val cont -> return $ Yield val cont
                                Pass -> error "Pass in Eapp"
                                _ -> error "Function not found"
                _ -> error "Function not found hi"
        Nothing -> error "Function not found"
        
evalExp (EGen a fun) = do
    -- ensure that the fun is a function with one natural number as argument
    env <- ask
    case Map.lookup fun env of
        Just loc -> do
            (maxloc, store) <- get
            case Map.lookup loc store of
                Just (VFun [arg] body env') -> return $ Return $ VGen fun 0
                _ -> error "Function not found"
        Nothing -> error "Function not found"
    
    

evalExp (ETake a ident) = do
    env <- ask
    store <- get
    let loc = case Map.lookup ident env of
                Just loc -> loc
                Nothing -> error "Variable not found"
    let gen = getValueFromStore loc store
    case gen of
        VGen fun n -> do 
            ret <- evalExp (EApp a fun [ELitInt a (fromIntegral n)]) 
            -- increment the generator by one
            case ret of
                Return val -> do
                    let newgen = VGen fun (n + 1)
                    insert loc newgen
                    return $ Return val
                _ -> error "Type error"
        _ -> error "Type error"
   

evalExp (ESlice _ ident start stop) = do
    env <- ask
    store <- get
    let val = getValue ident env store
    startret <- evalExp start
    stopret <- evalExp stop
    let (startval, stopval) = case (startret, stopret) of
                                (Return v1, Return v2) -> (v1, v2)
                                _ -> error "Type error: expected Return"
    case (val, startval, stopval) of
        (VList l, VInt start, VInt stop) -> return $ Return $ VList $ take (stop - start + 1) $ drop start l
        (VString s, VInt start, VInt stop) -> return $ Return $ VString $ take (stop - start + 1) $ drop start s
        _ -> error "Type error"


evalExp (EString _ s) = return $ Return (VString s)

evalExp (EAnon a args exp) = do
    env <- ask
    return $ Return $ VFun args [Ret a exp] env

evalExp (EElem _ ident exp) = do
    env <- ask
    store <- get
    let val = getValue ident env store
    ret <- evalExp exp
    let index = case ret of
                  Return v -> v
                  _ -> error "Type error: expected Return"
    case (val, index) of
        (VList l, VInt n) -> return $ Return $ l !! n
        (VString s, VInt n) -> return $ Return $ VString [s !! n]
        _ -> error "Type error"

evalExp (Neg _ exp) = do
    ret  <- evalExp  exp
    let val = case ret of
                 Return v -> v
                 _ -> error "Type error: expected Return"
    case val of
        VInt n -> return $ Return $ VInt (-n)
        _ -> error "Type error"

evalExp (Not _ exp) = do
    --val <- evalExp  exp
    ret  <- evalExp  exp
    let val = case ret of
                 Return v -> v
                 _ -> error "Type error: expected Return"
    case val of
        VBool b -> return $ Return $ VBool (not b)
        _ -> error "Type error"

evalExp  (Pow _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VInt v1, VInt v2)  -> return $ Return $ VInt (v1 ^ v2)
        (VString s, VInt n) -> return $ Return $ VString (concat $ replicate n s)
        (VInt n, VString s) -> return $ Return $ VString (concat $ replicate n s)
        _ -> error "Type error"

evalExp  (EAdd _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VInt v1, VInt v2) -> return $ Return $ VInt (v1 + v2)
        --(VString s1, VString s2) -> return $ VString (s1 ++ s2)
        (VList l1, VList l2) -> return $ Return $ VList (l1 ++ l2)
        _ -> fail $ "Type error"  ++ show val1 ++ " + " ++ show val2

evalExp  (ESub _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VInt v1, VInt v2) -> return $ Return $ VInt (v1 - v2)
        _ -> fail $ "Type error" ++ show val1 ++ " - " ++ show val2

evalExp  (EMul _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          (_, BreakLoop) -> error "Break not allowed here"
                          (_, Continue)  -> error "Continue not allowed here"
                          (_, Yield v c)   -> error "Yield not allowed here"
                          (_, Pass)      -> error "Pass not allowed here"
                          _ -> do 
                                error "Type error: expected Return"
    case (val1, val2) of
        (VInt v1, VInt v2) -> return $ Return $ VInt (v1 * v2)
        (VString s1, VString s2) -> return $ Return $ VString (s1 ++ s2)
        _ -> fail $ "Type error" ++ show val1 ++ " * " ++ show val2

evalExp  (EDiv _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VInt v1, VInt 0) -> error "Division by zero"
        (VInt v1, VInt v2) -> return $ Return $ VInt (v1 `div` v2)
        _ -> fail $ "Type error" ++ show val1 ++ " / " ++ show val2

evalExp  (EMod _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VInt v1, VInt 0) -> error "Division by zero"
        (VInt v1, VInt v2) -> return $ Return $ VInt (v1 `mod` v2)
        _ -> fail $ "Type error "++ show val1 ++ " % " ++ show val2

evalExp  (EAnd _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VBool b1, VBool b2) -> return $ Return $ VBool (b1 && b2)
        _ -> fail $ "Type error" ++ show val1 ++ " && " ++ show val2

evalExp  (EOr _ exp1 exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VBool b1, VBool b2) -> return $ Return $ VBool (b1 || b2)
        _ -> fail $ "Type error" ++ show val1 ++ " || " ++ show val2

evalExp  (ERel _ exp1 op exp2) = do
    ret1 <- evalExp  exp1
    ret2 <- evalExp  exp2
    let (val1, val2) = case (ret1, ret2) of
                          (Return v1, Return v2) -> (v1, v2)
                          _ -> error "Type error: expected Return"
    case (val1, val2) of
        (VInt v1, VInt v2) -> return $ Return $ VBool $ case op of
            LTH _ -> v1 < v2
            LE  _ -> v1 <= v2
            GTH _ -> v1 > v2
            GE  _ -> v1 >= v2
            EQU _ -> v1 == v2
            NE  _ -> v1 /= v2
        _ -> fail $ "Type error " ++ show val1 ++ " " ++ show op ++ " " ++ show val2

--------------------------- Eval statements ----------------------------------------------

evalElifs :: (Show a) => (ElIfs a) -> [Stmt a] -> ReaderT Env (StateT (Store a) IO) (ReturnType a)
evalElifs (NilElif _)  elseStmts = evalStmts elseStmts
evalElifs (CondElIfs _ (CondElIf _ expr ifStmts) elifs) elseStmts = do
    env <- ask
    store <- get
    ret <- evalExp expr
    let val = case ret of
                 Return v -> v
                 _ -> error "Type error: expected Return"
    case val of
        VBool True -> do --evalStmts ifStmts
            ret <- evalStmts ifStmts
            --liftIO $ print ifStmts
            case ret of
                Return val -> return (Return val)
                Pass -> return Pass
        VBool False -> do -- evalElifs elifs elseStmts
            --liftIO $ print elifs
            ret <- evalElifs elifs elseStmts
            case ret of 
                Return val -> return (Return val)
                Pass -> return Pass
                Continue -> return Continue
                BreakLoop -> return BreakLoop

        _ -> error "Type error"
        

evalFor :: (Show a) => Ident -> [Value a] -> [Stmt a] -> ReaderT Env (StateT (Store a) IO) (ReturnType a)
evalFor varIdent [] stmts = return Pass
evalFor varIdent (i:is) stmts = do
    env <- ask -- get the environment from the reader
    case Map.lookup varIdent env of
        Just loc -> do
            (maxloc, store) <- get -- get the store from the state
            put $ (maxloc, Map.insert loc i store) -- insert the value of the variable into the store
            let env' = Map.insert varIdent loc env -- insert the variable into the environment
            local (const env') $ do -- run the statements in the new environment
                ret <- evalStmts stmts
                case ret of
                    BreakLoop -> return Pass
                    Continue -> evalFor varIdent is stmts
                    Pass -> evalFor varIdent is stmts
                    Return val -> return (Return val)
        Nothing -> do
            error "Variable not found" 

getValueFromMap :: Loc -> (Map Loc (Value a)) -> (Value a)
getValueFromMap loc store = case Map.lookup loc store of
    Just val -> val
    Nothing -> error "Variable not found"


getValueFromStore :: Loc -> (Store a) -> (Value a)
getValueFromStore loc (_, store) = case Map.lookup loc store of
    Just val -> val
    Nothing -> error "Variable not found"

getValue :: Ident -> Env -> (Store a) -> (Value a)
getValue ident env store   = case Map.lookup ident env of
    Just loc -> getValueFromStore loc store
    Nothing -> error "Variable not found"

evalStmt :: (Show a) => (Stmt a) ->  ReaderT Env (StateT (Store a) IO) (ReturnType a)
evalStmt (Empty _) = return Pass

evalStmt (Cond _ expr stmts elifs) = do
    val <- evalExp expr
    env <- ask
    store <- get
    case val of
        Return (VBool True) -> do  --evalStmts stmts
            ret <- evalStmts stmts
            case ret of
                BreakLoop -> return  BreakLoop
                continue -> return continue
                Return val -> return (Return val)
                Yield val cont -> return (Yield val cont)    
        Return (VBool False) -> evalElifs elifs []
        _ -> do error "Type error"

evalStmt (CondElse _ expr stmts elifs stmts') = do
    val <- evalExp expr
    env <- ask
    store <- get
    --let val = evalExp  expr
    case val of
        Return (VBool True) -> evalStmts stmts
        --VBool False -> evalElifs elifs stmts'
        Return (VBool False) -> evalElifs elifs stmts'
        _ -> error "Type error"

evalStmt (While a expr stmts) = do
    --val <- evalExp expr
    env <- ask
    store <- get
    val <- evalExp  expr
    case val of
        Return (VBool True) -> do 
            ret <- evalStmts stmts
            case ret of
                BreakLoop -> return Pass
                Continue -> evalStmt (While a expr stmts)
                Pass -> evalStmt (While a expr stmts)
                Return val -> return (Return val)


        Return (VBool False) -> return Pass
        _ -> error "Type error" 


evalStmt (For _ varIdent startIdent stopIdent stmts) = do
    --env <- ask
    --store <- get
    startRet <- evalExp startIdent
    stopRet <- evalExp stopIdent
    let (startVal, stopVal) = case (startRet, stopRet) of
                                (Return v1, Return v2) -> (v1, v2)
                                _ -> error "Type error: expected Return"
    case (startVal, stopVal) of
        (VInt start, VInt stop) -> do
            env <- ask
            store <- get
            r <- alloc
            let loc = retToInt r
            let env' = Map.insert varIdent loc env
            local (const env') $ do
                let iterVals = map VInt [start..stop]
                evalFor varIdent iterVals stmts
            
        _ -> error "Type error" 

    

evalStmt (ForIn _ varIdent iterableIndent stmts) = do
    env <- ask
    store <- get
    --iterableVal = getValue iterableIndent env store
    case getValue iterableIndent env store of
        VList l -> do
            env <- ask
            r <- alloc
            let loc = retToInt r
            let env' = Map.insert varIdent loc env
            local (const env') $ do
                evalFor varIdent l stmts -- czy to ok?
        VString s ->  error "String iteration not implemented yet"
        _ -> error "Type error"


evalStmt (Break _) = return BreakLoop  

evalStmt (Cont _) = return Continue




evalStmt (Ret _ expr) = do
    ret <- evalExp expr
    let val = case ret of
                Return v -> v
                _ -> error "Type error: expected Return"
    return $ Return val

evalStmt (VRet _) = return Pass

evalStmt (Print _ expr) = do
    ret <- evalExp expr
    let val = case ret of
                Return v -> v
                BreakLoop -> error "Break not allowed here"
                Continue -> error "Continue not allowed here"
                Yield v cont -> error "Yield not allowed here"
                Pass -> error "Pass not allowed here"
                _ -> error "Type error: expected Return"
    
    liftIO $ print val
    return Pass


-- evalStmt :: Statement -> ReaderT Env m Result
evalStmts :: (Show a) => [Stmt a] ->  ReaderT Env (StateT (Store a) IO) (ReturnType a)
evalStmts [] = return Pass -- if there are no statements to evaluate then return Passd
--evalStmts [] = error "empty"
evalStmts (s:ss) = do
    env <- ask
    --(_, store) <- get
    case s of
        Break _ -> return BreakLoop
        Cont  _ -> return Continue
        Ret _ expr -> evalExp expr
        Yeld _ expr -> do 
            liftIO $ print "Yield"
            ret <- evalExp expr
            let val = retToVal ret
            --rest <- evalStmts ss
            return $ Yield val (evalStmts ss)
        (Ass _ ident asg expr) -> do 
            (newenv, newstore) <- do 
                ret <- evalExp expr
                (_, store) <- get
                let val = case ret of
                        Return v -> v
                        _ -> error "Type error: expected Return"
                case asg of 
                    Eq _ -> do
                        (env', store') <- case Map.lookup ident env of
                            Just loc -> do
                                let store' = Map.insert loc val store
                                return (env, store')
                            Nothing -> do 
                                rloc <- alloc
                                let newloc = retToInt rloc
                                let store' = Map.insert newloc val store
                                let env' = Map.insert ident newloc env
                                return (env', store')
                        return (env', store')
                    PlEq _ -> do
                        (env', store') <- case Map.lookup ident env of
                            Just loc -> do
                                let preval = getValueFromMap loc store
                                case (preval, val) of
                                    (VInt x, VInt y) -> do
                                        let newval = VInt (x + y)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    _ -> error "Type error hi"
                            Nothing -> do 
                                error "Variable not found"
                        return (env', store')
                    MnEq _ -> do
                        (env', store') <- case Map.lookup ident env of
                            Just loc -> do
                                let preval = getValueFromMap loc store
                                case (preval, val) of
                                    (VInt x, VInt y) -> do
                                        let newval = VInt (x - y)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    _ -> error "Type error hi"
                            Nothing -> do 
                                error "Variable not found"
                        return (env', store')
                    MulEq _ -> do
                        (env', store') <- case Map.lookup ident env of
                            Just loc -> do
                                let preval = getValueFromMap loc store
                                case (preval, val) of
                                    (VInt x, VInt y) -> do
                                        let newval = VInt (x * y)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    (VString s, VString t) -> do
                                        let newval = VString (s ++ t)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    (VList l1, VList l2) -> do
                                        let newval = VList (l1 ++ l2)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    _ -> error "Type error hi"
                            Nothing -> do 
                                error "Variable not found"
                        return (env', store')
                    DivEq _ -> do
                        (env', store') <- case Map.lookup ident env of
                            Just loc -> do
                                let preval = getValueFromMap loc store
                                case (preval, val) of
                                    (VInt x, VInt y) -> do
                                        if y == 0
                                            then error "Division by zero"
                                        else do
                                            let newval = VInt (x `div` y)
                                            let store' = Map.insert loc newval store
                                            return (env, store')
                                    _ -> error "Type error hi"
                            Nothing -> do 
                                error "Variable not found"
                        return (env', store')
                    PowEq _ -> do
                        (env', store') <- case Map.lookup ident env of
                            Just loc -> do
                                let preval = getValueFromMap loc store
                                case (preval, val) of
                                    (VInt x, VInt y) -> do
                                        let newval = VInt (x ^ y)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    (VString s, VInt n) -> do
                                        let newval = VString (concat $ replicate (fromIntegral n) s)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    (VInt n, VString s) -> do
                                        let newval = VString (concat $ replicate (fromIntegral n) s)
                                        let store' = Map.insert loc newval store
                                        return (env, store')
                                    _ -> error "Type error hi"
                            Nothing -> do 
                                error "Variable not found"
                        return (env', store')
                    _ -> error "bad asg:" 
             -- update the store
            (maxloc, _) <- get
            put (maxloc, newstore)
            local (const newenv) $ evalStmts ss
        

        (Func _ fname args body) -> do
            retloc <- alloc 
            env <- ask
            let loc = retToInt retloc -- get the location for the function
            let env' = Map.insert fname loc env -- insert the function into the environment
            let fun = VFun args body env' -- create the function
            (_ , store) <- get
            put (loc + 1, Map.insert loc fun store)
            local (const env') $ evalStmts ss
        
        
        _ -> do 
            ret <- evalStmt s
            case ret of
                BreakLoop -> return BreakLoop
                Continue  -> return Continue
                Return val -> do --return (Return val)
                    return $ Return val
                Pass -> do
                    evalStmts ss
                _ -> evalStmts ss --error "Type error"
            --evalStmts ss

                
-- Eval program ----------------------------------------------

interpret :: (Show a) => (Program a) -> IO ()
interpret (Prog _ stmts) = do
    let initState = (0, Map.empty)
    finalState <- execStateT (runReaderT (evalStmts stmts) Map.empty) initState
    return ()



