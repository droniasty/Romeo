module Main where

import Control.Monad.Reader
import Control.Monad.State
import qualified Data.Map as Map

--import interpreter
import AbsRomeo
import LexRomeo
import ParRomeo
import ErrM
import Interpreter  -- this is the file that contains the interpreter
import System.Environment (getArgs) -- for getArgs



main :: IO () 
main = do
  --- readFile to read from a file
  args <- getArgs
  let filename = head args
  content <- readFile filename
  let parseResult = pProgram $ myLexer content
  --liftIO $ print parseResult
  case parseResult of
    Bad s -> putStrLn "Parse failed"
    Ok tree -> interpret tree
