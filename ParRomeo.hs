{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParRomeo where
import AbsRomeo
import LexRomeo
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Ident)
	| HappyAbsSyn5 (Integer)
	| HappyAbsSyn6 (String)
	| HappyAbsSyn7 ((Program ()))
	| HappyAbsSyn8 ([Stmt ()])
	| HappyAbsSyn9 ((Stmt ()))
	| HappyAbsSyn10 ((Item ()))
	| HappyAbsSyn11 ([Item ()])
	| HappyAbsSyn12 ((ElIfs ()))
	| HappyAbsSyn13 ((ElIf ()))
	| HappyAbsSyn14 ((List ()))
	| HappyAbsSyn15 (Expr ())
	| HappyAbsSyn22 ((Expr ()))
	| HappyAbsSyn23 ([Expr ()])
	| HappyAbsSyn24 ([Ident])
	| HappyAbsSyn25 ((Asg ()))
	| HappyAbsSyn26 ((AddOp ()))
	| HappyAbsSyn27 ((MulOp ()))
	| HappyAbsSyn28 ((RelOp ()))

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126,
 action_127,
 action_128,
 action_129,
 action_130,
 action_131,
 action_132,
 action_133,
 action_134,
 action_135,
 action_136,
 action_137,
 action_138,
 action_139,
 action_140,
 action_141,
 action_142,
 action_143,
 action_144,
 action_145,
 action_146,
 action_147,
 action_148,
 action_149,
 action_150,
 action_151,
 action_152,
 action_153,
 action_154,
 action_155,
 action_156,
 action_157,
 action_158,
 action_159,
 action_160,
 action_161,
 action_162,
 action_163 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76,
 happyReduce_77,
 happyReduce_78,
 happyReduce_79,
 happyReduce_80,
 happyReduce_81,
 happyReduce_82,
 happyReduce_83,
 happyReduce_84 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,766) ([0,0,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,1026,11619,2,0,9472,32801,0,0,0,0,0,0,0,0,0,0,0,0,0,33040,45056,2056,229,0,0,64,0,0,0,0,128,0,0,0,0,0,0,256,0,0,0,0,512,0,8704,16,278,7329,0,16384,0,0,0,0,34816,4160,1112,29316,0,4096,129,2224,58632,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1088,4,0,0,0,8192,1,0,0,0,640,15104,0,0,0,0,0,0,64,0,0,0,0,0,0,8192,0,278,7329,0,17408,32,556,14658,0,32768,0,1112,29316,0,0,0,0,0,0,0,0,0,0,0,16384,516,8896,37920,3,0,0,0,0,1,0,16,0,0,0,0,0,0,0,4,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,2176,32772,16453,1832,0,0,0,0,0,0,8192,0,0,0,0,0,16384,0,8,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,16384,516,8896,37920,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,2176,32772,16453,1832,0,0,0,0,512,0,0,0,0,1024,0,0,2048,44048,2229,0,0,1,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,2,0,32,0,0,0,0,4096,4,128,0,0,0,32768,0,0,0,0,32768,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,512,29444,557,0,8704,16,278,7329,0,17408,32,556,14658,0,0,0,0,0,0,4096,129,2224,58632,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8260,11264,16898,57,0,16520,22528,33796,114,0,33040,45056,2056,229,0,544,24577,4113,458,0,1088,49154,8226,916,0,2176,32772,16453,1832,0,4352,8,32907,3664,0,0,512,32,0,0,0,0,0,0,0,0,0,256,0,0,0,0,512,0,0,0,0,1024,0,0,0,4113,0,0,0,0,8226,0,0,0,0,0,0,0,0,0,4608,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,544,24577,4113,458,0,0,0,0,0,0,2176,32772,16453,1832,0,4352,8,32907,3664,0,0,0,0,1024,0,17408,32,556,14658,0,0,1,0,0,0,0,512,0,0,0,0,0,0,16384,0,0,32768,0,0,0,0,0,0,10,0,0,0,0,8,0,0,4130,5632,41217,28,0,128,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0,0,0,0,1088,49154,8226,916,0,0,256,47490,278,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,2048,0,0,0,0,128,0,0,0,0,0,0,4096,0,0,0,0,1,0,0,0,0,0,0,0,0,64,0,0,0,2176,32772,16453,1832,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,34816,64,1112,29316,0,0,0,0,0,0,8192,258,4448,51728,1,0,32768,49408,35676,0,0,0,33281,5809,1,0,0,1026,11635,2,0,0,0,0,0,0,0,0,0,0,0,0,8208,27544,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,12,0,0,0,256,0,0,0,0,0,0,0,0,17408,32,556,14658,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","Ident","Integer","String","Program","ListStmt","Stmt","Item","ListItem","ElIfs","ElIf","List","Expr7","Expr6","Expr5","Expr4","Expr3","Expr2","Expr1","Expr","ListExpr","ListIdent","Asg","AddOp","MulOp","RelOp","'!'","'!='","'%'","'&&'","'('","')'","'*'","'*='","'+'","'+='","','","'-'","'-='","'->'","'/'","'/='","':'","';'","'<'","'<='","'='","'=='","'>'","'>='","'False'","'True'","'Yield'","'['","']'","'^'","'^='","'apply'","'break'","'continue'","'else'","'elseif'","'end'","'for'","'function'","'generator'","'if'","'in'","'println'","'return'","'take'","'while'","'{'","'||'","'}'","L_ident","L_integ","L_quoted","%eof"]
        bit_start = st Prelude.* 81
        bit_end = (st Prelude.+ 1) Prelude.* 81
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..80]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (7) = happyGoto action_3
action_0 (8) = happyGoto action_4
action_0 _ = happyReduce_5

action_1 (78) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (81) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (46) = happyShift action_7
action_4 (55) = happyShift action_8
action_4 (61) = happyShift action_9
action_4 (62) = happyShift action_10
action_4 (66) = happyShift action_11
action_4 (67) = happyShift action_12
action_4 (69) = happyShift action_13
action_4 (71) = happyShift action_14
action_4 (72) = happyShift action_15
action_4 (74) = happyShift action_16
action_4 (78) = happyShift action_2
action_4 (4) = happyGoto action_5
action_4 (9) = happyGoto action_6
action_4 _ = happyReduce_4

action_5 (36) = happyShift action_51
action_5 (38) = happyShift action_52
action_5 (41) = happyShift action_53
action_5 (44) = happyShift action_54
action_5 (49) = happyShift action_55
action_5 (59) = happyShift action_56
action_5 (25) = happyGoto action_50
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_6

action_7 _ = happyReduce_7

action_8 (29) = happyShift action_29
action_8 (33) = happyShift action_30
action_8 (40) = happyShift action_31
action_8 (53) = happyShift action_32
action_8 (54) = happyShift action_33
action_8 (56) = happyShift action_34
action_8 (60) = happyShift action_35
action_8 (68) = happyShift action_36
action_8 (73) = happyShift action_37
action_8 (75) = happyShift action_38
action_8 (78) = happyShift action_2
action_8 (79) = happyShift action_39
action_8 (80) = happyShift action_40
action_8 (4) = happyGoto action_17
action_8 (5) = happyGoto action_18
action_8 (6) = happyGoto action_19
action_8 (14) = happyGoto action_20
action_8 (15) = happyGoto action_21
action_8 (16) = happyGoto action_22
action_8 (17) = happyGoto action_23
action_8 (18) = happyGoto action_24
action_8 (19) = happyGoto action_25
action_8 (20) = happyGoto action_26
action_8 (21) = happyGoto action_27
action_8 (22) = happyGoto action_49
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (46) = happyShift action_48
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (46) = happyShift action_47
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (78) = happyShift action_2
action_11 (4) = happyGoto action_46
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (78) = happyShift action_2
action_12 (4) = happyGoto action_45
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (29) = happyShift action_29
action_13 (33) = happyShift action_30
action_13 (40) = happyShift action_31
action_13 (53) = happyShift action_32
action_13 (54) = happyShift action_33
action_13 (56) = happyShift action_34
action_13 (60) = happyShift action_35
action_13 (68) = happyShift action_36
action_13 (73) = happyShift action_37
action_13 (75) = happyShift action_38
action_13 (78) = happyShift action_2
action_13 (79) = happyShift action_39
action_13 (80) = happyShift action_40
action_13 (4) = happyGoto action_17
action_13 (5) = happyGoto action_18
action_13 (6) = happyGoto action_19
action_13 (14) = happyGoto action_20
action_13 (15) = happyGoto action_21
action_13 (16) = happyGoto action_22
action_13 (17) = happyGoto action_23
action_13 (18) = happyGoto action_24
action_13 (19) = happyGoto action_25
action_13 (20) = happyGoto action_26
action_13 (21) = happyGoto action_27
action_13 (22) = happyGoto action_44
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (33) = happyShift action_43
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (29) = happyShift action_29
action_15 (33) = happyShift action_30
action_15 (40) = happyShift action_31
action_15 (46) = happyShift action_42
action_15 (53) = happyShift action_32
action_15 (54) = happyShift action_33
action_15 (56) = happyShift action_34
action_15 (60) = happyShift action_35
action_15 (68) = happyShift action_36
action_15 (73) = happyShift action_37
action_15 (75) = happyShift action_38
action_15 (78) = happyShift action_2
action_15 (79) = happyShift action_39
action_15 (80) = happyShift action_40
action_15 (4) = happyGoto action_17
action_15 (5) = happyGoto action_18
action_15 (6) = happyGoto action_19
action_15 (14) = happyGoto action_20
action_15 (15) = happyGoto action_21
action_15 (16) = happyGoto action_22
action_15 (17) = happyGoto action_23
action_15 (18) = happyGoto action_24
action_15 (19) = happyGoto action_25
action_15 (20) = happyGoto action_26
action_15 (21) = happyGoto action_27
action_15 (22) = happyGoto action_41
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (29) = happyShift action_29
action_16 (33) = happyShift action_30
action_16 (40) = happyShift action_31
action_16 (53) = happyShift action_32
action_16 (54) = happyShift action_33
action_16 (56) = happyShift action_34
action_16 (60) = happyShift action_35
action_16 (68) = happyShift action_36
action_16 (73) = happyShift action_37
action_16 (75) = happyShift action_38
action_16 (78) = happyShift action_2
action_16 (79) = happyShift action_39
action_16 (80) = happyShift action_40
action_16 (4) = happyGoto action_17
action_16 (5) = happyGoto action_18
action_16 (6) = happyGoto action_19
action_16 (14) = happyGoto action_20
action_16 (15) = happyGoto action_21
action_16 (16) = happyGoto action_22
action_16 (17) = happyGoto action_23
action_16 (18) = happyGoto action_24
action_16 (19) = happyGoto action_25
action_16 (20) = happyGoto action_26
action_16 (21) = happyGoto action_27
action_16 (22) = happyGoto action_28
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (56) = happyShift action_92
action_17 _ = happyReduce_31

action_18 _ = happyReduce_32

action_19 _ = happyReduce_41

action_20 _ = happyReduce_33

action_21 _ = happyReduce_46

action_22 _ = happyReduce_48

action_23 (58) = happyShift action_91
action_23 _ = happyReduce_52

action_24 (31) = happyShift action_88
action_24 (35) = happyShift action_89
action_24 (43) = happyShift action_90
action_24 _ = happyReduce_55

action_25 (37) = happyShift action_86
action_25 (40) = happyShift action_87
action_25 _ = happyReduce_57

action_26 (30) = happyShift action_79
action_26 (32) = happyShift action_80
action_26 (47) = happyShift action_81
action_26 (48) = happyShift action_82
action_26 (50) = happyShift action_83
action_26 (51) = happyShift action_84
action_26 (52) = happyShift action_85
action_26 (28) = happyGoto action_78
action_26 _ = happyReduce_59

action_27 (76) = happyShift action_77
action_27 _ = happyReduce_61

action_28 (8) = happyGoto action_76
action_28 _ = happyReduce_5

action_29 (33) = happyShift action_30
action_29 (53) = happyShift action_32
action_29 (54) = happyShift action_33
action_29 (56) = happyShift action_34
action_29 (60) = happyShift action_35
action_29 (68) = happyShift action_36
action_29 (73) = happyShift action_37
action_29 (75) = happyShift action_38
action_29 (78) = happyShift action_2
action_29 (79) = happyShift action_39
action_29 (80) = happyShift action_40
action_29 (4) = happyGoto action_72
action_29 (5) = happyGoto action_18
action_29 (6) = happyGoto action_19
action_29 (14) = happyGoto action_20
action_29 (15) = happyGoto action_75
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (29) = happyShift action_29
action_30 (33) = happyShift action_30
action_30 (40) = happyShift action_31
action_30 (53) = happyShift action_32
action_30 (54) = happyShift action_33
action_30 (56) = happyShift action_34
action_30 (60) = happyShift action_35
action_30 (68) = happyShift action_36
action_30 (73) = happyShift action_37
action_30 (75) = happyShift action_38
action_30 (78) = happyShift action_2
action_30 (79) = happyShift action_39
action_30 (80) = happyShift action_40
action_30 (4) = happyGoto action_17
action_30 (5) = happyGoto action_18
action_30 (6) = happyGoto action_19
action_30 (14) = happyGoto action_20
action_30 (15) = happyGoto action_21
action_30 (16) = happyGoto action_22
action_30 (17) = happyGoto action_23
action_30 (18) = happyGoto action_24
action_30 (19) = happyGoto action_25
action_30 (20) = happyGoto action_26
action_30 (21) = happyGoto action_27
action_30 (22) = happyGoto action_74
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (33) = happyShift action_30
action_31 (53) = happyShift action_32
action_31 (54) = happyShift action_33
action_31 (56) = happyShift action_34
action_31 (60) = happyShift action_35
action_31 (68) = happyShift action_36
action_31 (73) = happyShift action_37
action_31 (75) = happyShift action_38
action_31 (78) = happyShift action_2
action_31 (79) = happyShift action_39
action_31 (80) = happyShift action_40
action_31 (4) = happyGoto action_72
action_31 (5) = happyGoto action_18
action_31 (6) = happyGoto action_19
action_31 (14) = happyGoto action_20
action_31 (15) = happyGoto action_73
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_35

action_33 _ = happyReduce_34

action_34 (29) = happyShift action_29
action_34 (33) = happyShift action_30
action_34 (40) = happyShift action_31
action_34 (53) = happyShift action_32
action_34 (54) = happyShift action_33
action_34 (56) = happyShift action_34
action_34 (60) = happyShift action_35
action_34 (68) = happyShift action_36
action_34 (73) = happyShift action_37
action_34 (75) = happyShift action_38
action_34 (78) = happyShift action_2
action_34 (79) = happyShift action_39
action_34 (80) = happyShift action_40
action_34 (4) = happyGoto action_17
action_34 (5) = happyGoto action_18
action_34 (6) = happyGoto action_19
action_34 (14) = happyGoto action_20
action_34 (15) = happyGoto action_21
action_34 (16) = happyGoto action_22
action_34 (17) = happyGoto action_23
action_34 (18) = happyGoto action_24
action_34 (19) = happyGoto action_25
action_34 (20) = happyGoto action_26
action_34 (21) = happyGoto action_27
action_34 (22) = happyGoto action_70
action_34 (23) = happyGoto action_71
action_34 _ = happyReduce_62

action_35 (78) = happyShift action_2
action_35 (4) = happyGoto action_69
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (33) = happyShift action_68
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (78) = happyShift action_2
action_37 (4) = happyGoto action_67
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (78) = happyShift action_2
action_38 (4) = happyGoto action_65
action_38 (24) = happyGoto action_66
action_38 _ = happyReduce_65

action_39 _ = happyReduce_2

action_40 _ = happyReduce_3

action_41 (46) = happyShift action_64
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_18

action_43 (29) = happyShift action_29
action_43 (33) = happyShift action_30
action_43 (40) = happyShift action_31
action_43 (53) = happyShift action_32
action_43 (54) = happyShift action_33
action_43 (56) = happyShift action_34
action_43 (60) = happyShift action_35
action_43 (68) = happyShift action_36
action_43 (73) = happyShift action_37
action_43 (75) = happyShift action_38
action_43 (78) = happyShift action_2
action_43 (79) = happyShift action_39
action_43 (80) = happyShift action_40
action_43 (4) = happyGoto action_17
action_43 (5) = happyGoto action_18
action_43 (6) = happyGoto action_19
action_43 (14) = happyGoto action_20
action_43 (15) = happyGoto action_21
action_43 (16) = happyGoto action_22
action_43 (17) = happyGoto action_23
action_43 (18) = happyGoto action_24
action_43 (19) = happyGoto action_25
action_43 (20) = happyGoto action_26
action_43 (21) = happyGoto action_27
action_43 (22) = happyGoto action_63
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (8) = happyGoto action_62
action_44 _ = happyReduce_5

action_45 (33) = happyShift action_61
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (49) = happyShift action_59
action_46 (70) = happyShift action_60
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_15

action_48 _ = happyReduce_14

action_49 (46) = happyShift action_58
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (29) = happyShift action_29
action_50 (33) = happyShift action_30
action_50 (40) = happyShift action_31
action_50 (53) = happyShift action_32
action_50 (54) = happyShift action_33
action_50 (56) = happyShift action_34
action_50 (60) = happyShift action_35
action_50 (68) = happyShift action_36
action_50 (73) = happyShift action_37
action_50 (75) = happyShift action_38
action_50 (78) = happyShift action_2
action_50 (79) = happyShift action_39
action_50 (80) = happyShift action_40
action_50 (4) = happyGoto action_17
action_50 (5) = happyGoto action_18
action_50 (6) = happyGoto action_19
action_50 (14) = happyGoto action_20
action_50 (15) = happyGoto action_21
action_50 (16) = happyGoto action_22
action_50 (17) = happyGoto action_23
action_50 (18) = happyGoto action_24
action_50 (19) = happyGoto action_25
action_50 (20) = happyGoto action_26
action_50 (21) = happyGoto action_27
action_50 (22) = happyGoto action_57
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_71

action_52 _ = happyReduce_69

action_53 _ = happyReduce_70

action_54 _ = happyReduce_72

action_55 _ = happyReduce_68

action_56 _ = happyReduce_73

action_57 (46) = happyShift action_121
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_19

action_59 (29) = happyShift action_29
action_59 (33) = happyShift action_30
action_59 (40) = happyShift action_31
action_59 (53) = happyShift action_32
action_59 (54) = happyShift action_33
action_59 (56) = happyShift action_34
action_59 (60) = happyShift action_35
action_59 (68) = happyShift action_36
action_59 (73) = happyShift action_37
action_59 (75) = happyShift action_38
action_59 (78) = happyShift action_2
action_59 (79) = happyShift action_39
action_59 (80) = happyShift action_40
action_59 (4) = happyGoto action_17
action_59 (5) = happyGoto action_18
action_59 (6) = happyGoto action_19
action_59 (14) = happyGoto action_20
action_59 (15) = happyGoto action_21
action_59 (16) = happyGoto action_22
action_59 (17) = happyGoto action_23
action_59 (18) = happyGoto action_24
action_59 (19) = happyGoto action_25
action_59 (20) = happyGoto action_26
action_59 (21) = happyGoto action_27
action_59 (22) = happyGoto action_120
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (78) = happyShift action_2
action_60 (4) = happyGoto action_119
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (78) = happyShift action_2
action_61 (4) = happyGoto action_65
action_61 (24) = happyGoto action_118
action_61 _ = happyReduce_65

action_62 (46) = happyShift action_7
action_62 (55) = happyShift action_8
action_62 (61) = happyShift action_9
action_62 (62) = happyShift action_10
action_62 (64) = happyShift action_117
action_62 (66) = happyShift action_11
action_62 (67) = happyShift action_12
action_62 (69) = happyShift action_13
action_62 (71) = happyShift action_14
action_62 (72) = happyShift action_15
action_62 (74) = happyShift action_16
action_62 (78) = happyShift action_2
action_62 (4) = happyGoto action_5
action_62 (9) = happyGoto action_6
action_62 (12) = happyGoto action_115
action_62 (13) = happyGoto action_116
action_62 _ = happyReduce_25

action_63 (34) = happyShift action_114
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_17

action_65 (39) = happyShift action_113
action_65 _ = happyReduce_66

action_66 (77) = happyShift action_112
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_38

action_68 (78) = happyShift action_2
action_68 (4) = happyGoto action_111
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (33) = happyShift action_110
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (39) = happyShift action_107
action_70 (45) = happyShift action_108
action_70 (66) = happyShift action_109
action_70 _ = happyReduce_63

action_71 (57) = happyShift action_106
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (56) = happyShift action_105
action_72 _ = happyReduce_31

action_73 _ = happyReduce_44

action_74 (34) = happyShift action_104
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_45

action_76 (46) = happyShift action_7
action_76 (55) = happyShift action_8
action_76 (61) = happyShift action_9
action_76 (62) = happyShift action_10
action_76 (65) = happyShift action_103
action_76 (66) = happyShift action_11
action_76 (67) = happyShift action_12
action_76 (69) = happyShift action_13
action_76 (71) = happyShift action_14
action_76 (72) = happyShift action_15
action_76 (74) = happyShift action_16
action_76 (78) = happyShift action_2
action_76 (4) = happyGoto action_5
action_76 (9) = happyGoto action_6
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (29) = happyShift action_29
action_77 (33) = happyShift action_30
action_77 (40) = happyShift action_31
action_77 (53) = happyShift action_32
action_77 (54) = happyShift action_33
action_77 (56) = happyShift action_34
action_77 (60) = happyShift action_35
action_77 (68) = happyShift action_36
action_77 (73) = happyShift action_37
action_77 (75) = happyShift action_38
action_77 (78) = happyShift action_2
action_77 (79) = happyShift action_39
action_77 (80) = happyShift action_40
action_77 (4) = happyGoto action_17
action_77 (5) = happyGoto action_18
action_77 (6) = happyGoto action_19
action_77 (14) = happyGoto action_20
action_77 (15) = happyGoto action_21
action_77 (16) = happyGoto action_22
action_77 (17) = happyGoto action_23
action_77 (18) = happyGoto action_24
action_77 (19) = happyGoto action_25
action_77 (20) = happyGoto action_26
action_77 (21) = happyGoto action_27
action_77 (22) = happyGoto action_102
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (29) = happyShift action_29
action_78 (33) = happyShift action_30
action_78 (40) = happyShift action_31
action_78 (53) = happyShift action_32
action_78 (54) = happyShift action_33
action_78 (56) = happyShift action_34
action_78 (60) = happyShift action_35
action_78 (68) = happyShift action_36
action_78 (73) = happyShift action_37
action_78 (75) = happyShift action_38
action_78 (78) = happyShift action_2
action_78 (79) = happyShift action_39
action_78 (80) = happyShift action_40
action_78 (4) = happyGoto action_17
action_78 (5) = happyGoto action_18
action_78 (6) = happyGoto action_19
action_78 (14) = happyGoto action_20
action_78 (15) = happyGoto action_21
action_78 (16) = happyGoto action_22
action_78 (17) = happyGoto action_23
action_78 (18) = happyGoto action_24
action_78 (19) = happyGoto action_101
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_84

action_80 (29) = happyShift action_29
action_80 (33) = happyShift action_30
action_80 (40) = happyShift action_31
action_80 (53) = happyShift action_32
action_80 (54) = happyShift action_33
action_80 (56) = happyShift action_34
action_80 (60) = happyShift action_35
action_80 (68) = happyShift action_36
action_80 (73) = happyShift action_37
action_80 (75) = happyShift action_38
action_80 (78) = happyShift action_2
action_80 (79) = happyShift action_39
action_80 (80) = happyShift action_40
action_80 (4) = happyGoto action_17
action_80 (5) = happyGoto action_18
action_80 (6) = happyGoto action_19
action_80 (14) = happyGoto action_20
action_80 (15) = happyGoto action_21
action_80 (16) = happyGoto action_22
action_80 (17) = happyGoto action_23
action_80 (18) = happyGoto action_24
action_80 (19) = happyGoto action_25
action_80 (20) = happyGoto action_26
action_80 (21) = happyGoto action_100
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_79

action_82 _ = happyReduce_80

action_83 _ = happyReduce_83

action_84 _ = happyReduce_81

action_85 _ = happyReduce_82

action_86 (29) = happyShift action_29
action_86 (33) = happyShift action_30
action_86 (40) = happyShift action_31
action_86 (53) = happyShift action_32
action_86 (54) = happyShift action_33
action_86 (56) = happyShift action_34
action_86 (60) = happyShift action_35
action_86 (68) = happyShift action_36
action_86 (73) = happyShift action_37
action_86 (75) = happyShift action_38
action_86 (78) = happyShift action_2
action_86 (79) = happyShift action_39
action_86 (80) = happyShift action_40
action_86 (4) = happyGoto action_17
action_86 (5) = happyGoto action_18
action_86 (6) = happyGoto action_19
action_86 (14) = happyGoto action_20
action_86 (15) = happyGoto action_21
action_86 (16) = happyGoto action_22
action_86 (17) = happyGoto action_23
action_86 (18) = happyGoto action_99
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (29) = happyShift action_29
action_87 (33) = happyShift action_30
action_87 (40) = happyShift action_31
action_87 (53) = happyShift action_32
action_87 (54) = happyShift action_33
action_87 (56) = happyShift action_34
action_87 (60) = happyShift action_35
action_87 (68) = happyShift action_36
action_87 (73) = happyShift action_37
action_87 (75) = happyShift action_38
action_87 (78) = happyShift action_2
action_87 (79) = happyShift action_39
action_87 (80) = happyShift action_40
action_87 (4) = happyGoto action_17
action_87 (5) = happyGoto action_18
action_87 (6) = happyGoto action_19
action_87 (14) = happyGoto action_20
action_87 (15) = happyGoto action_21
action_87 (16) = happyGoto action_22
action_87 (17) = happyGoto action_23
action_87 (18) = happyGoto action_98
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (29) = happyShift action_29
action_88 (33) = happyShift action_30
action_88 (40) = happyShift action_31
action_88 (53) = happyShift action_32
action_88 (54) = happyShift action_33
action_88 (56) = happyShift action_34
action_88 (60) = happyShift action_35
action_88 (68) = happyShift action_36
action_88 (73) = happyShift action_37
action_88 (75) = happyShift action_38
action_88 (78) = happyShift action_2
action_88 (79) = happyShift action_39
action_88 (80) = happyShift action_40
action_88 (4) = happyGoto action_17
action_88 (5) = happyGoto action_18
action_88 (6) = happyGoto action_19
action_88 (14) = happyGoto action_20
action_88 (15) = happyGoto action_21
action_88 (16) = happyGoto action_22
action_88 (17) = happyGoto action_97
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (29) = happyShift action_29
action_89 (33) = happyShift action_30
action_89 (40) = happyShift action_31
action_89 (53) = happyShift action_32
action_89 (54) = happyShift action_33
action_89 (56) = happyShift action_34
action_89 (60) = happyShift action_35
action_89 (68) = happyShift action_36
action_89 (73) = happyShift action_37
action_89 (75) = happyShift action_38
action_89 (78) = happyShift action_2
action_89 (79) = happyShift action_39
action_89 (80) = happyShift action_40
action_89 (4) = happyGoto action_17
action_89 (5) = happyGoto action_18
action_89 (6) = happyGoto action_19
action_89 (14) = happyGoto action_20
action_89 (15) = happyGoto action_21
action_89 (16) = happyGoto action_22
action_89 (17) = happyGoto action_96
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (29) = happyShift action_29
action_90 (33) = happyShift action_30
action_90 (40) = happyShift action_31
action_90 (53) = happyShift action_32
action_90 (54) = happyShift action_33
action_90 (56) = happyShift action_34
action_90 (60) = happyShift action_35
action_90 (68) = happyShift action_36
action_90 (73) = happyShift action_37
action_90 (75) = happyShift action_38
action_90 (78) = happyShift action_2
action_90 (79) = happyShift action_39
action_90 (80) = happyShift action_40
action_90 (4) = happyGoto action_17
action_90 (5) = happyGoto action_18
action_90 (6) = happyGoto action_19
action_90 (14) = happyGoto action_20
action_90 (15) = happyGoto action_21
action_90 (16) = happyGoto action_22
action_90 (17) = happyGoto action_95
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (29) = happyShift action_29
action_91 (33) = happyShift action_30
action_91 (40) = happyShift action_31
action_91 (53) = happyShift action_32
action_91 (54) = happyShift action_33
action_91 (56) = happyShift action_34
action_91 (60) = happyShift action_35
action_91 (68) = happyShift action_36
action_91 (73) = happyShift action_37
action_91 (75) = happyShift action_38
action_91 (78) = happyShift action_2
action_91 (79) = happyShift action_39
action_91 (80) = happyShift action_40
action_91 (4) = happyGoto action_17
action_91 (5) = happyGoto action_18
action_91 (6) = happyGoto action_19
action_91 (14) = happyGoto action_20
action_91 (15) = happyGoto action_21
action_91 (16) = happyGoto action_94
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (29) = happyShift action_29
action_92 (33) = happyShift action_30
action_92 (40) = happyShift action_31
action_92 (53) = happyShift action_32
action_92 (54) = happyShift action_33
action_92 (56) = happyShift action_34
action_92 (60) = happyShift action_35
action_92 (68) = happyShift action_36
action_92 (73) = happyShift action_37
action_92 (75) = happyShift action_38
action_92 (78) = happyShift action_2
action_92 (79) = happyShift action_39
action_92 (80) = happyShift action_40
action_92 (4) = happyGoto action_17
action_92 (5) = happyGoto action_18
action_92 (6) = happyGoto action_19
action_92 (14) = happyGoto action_20
action_92 (15) = happyGoto action_21
action_92 (16) = happyGoto action_22
action_92 (17) = happyGoto action_23
action_92 (18) = happyGoto action_24
action_92 (19) = happyGoto action_25
action_92 (20) = happyGoto action_26
action_92 (21) = happyGoto action_27
action_92 (22) = happyGoto action_93
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (45) = happyShift action_139
action_93 (57) = happyShift action_140
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_47

action_95 (58) = happyShift action_91
action_95 _ = happyReduce_50

action_96 (58) = happyShift action_91
action_96 _ = happyReduce_49

action_97 (58) = happyShift action_91
action_97 _ = happyReduce_51

action_98 (31) = happyShift action_88
action_98 (35) = happyShift action_89
action_98 (43) = happyShift action_90
action_98 _ = happyReduce_54

action_99 (31) = happyShift action_88
action_99 (35) = happyShift action_89
action_99 (43) = happyShift action_90
action_99 _ = happyReduce_53

action_100 _ = happyReduce_58

action_101 (37) = happyShift action_86
action_101 (40) = happyShift action_87
action_101 _ = happyReduce_56

action_102 _ = happyReduce_60

action_103 _ = happyReduce_11

action_104 _ = happyReduce_42

action_105 (29) = happyShift action_29
action_105 (33) = happyShift action_30
action_105 (40) = happyShift action_31
action_105 (53) = happyShift action_32
action_105 (54) = happyShift action_33
action_105 (56) = happyShift action_34
action_105 (60) = happyShift action_35
action_105 (68) = happyShift action_36
action_105 (73) = happyShift action_37
action_105 (75) = happyShift action_38
action_105 (78) = happyShift action_2
action_105 (79) = happyShift action_39
action_105 (80) = happyShift action_40
action_105 (4) = happyGoto action_17
action_105 (5) = happyGoto action_18
action_105 (6) = happyGoto action_19
action_105 (14) = happyGoto action_20
action_105 (15) = happyGoto action_21
action_105 (16) = happyGoto action_22
action_105 (17) = happyGoto action_23
action_105 (18) = happyGoto action_24
action_105 (19) = happyGoto action_25
action_105 (20) = happyGoto action_26
action_105 (21) = happyGoto action_27
action_105 (22) = happyGoto action_138
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_27

action_107 (29) = happyShift action_29
action_107 (33) = happyShift action_30
action_107 (40) = happyShift action_31
action_107 (53) = happyShift action_32
action_107 (54) = happyShift action_33
action_107 (56) = happyShift action_34
action_107 (60) = happyShift action_35
action_107 (68) = happyShift action_36
action_107 (73) = happyShift action_37
action_107 (75) = happyShift action_38
action_107 (78) = happyShift action_2
action_107 (79) = happyShift action_39
action_107 (80) = happyShift action_40
action_107 (4) = happyGoto action_17
action_107 (5) = happyGoto action_18
action_107 (6) = happyGoto action_19
action_107 (14) = happyGoto action_20
action_107 (15) = happyGoto action_21
action_107 (16) = happyGoto action_22
action_107 (17) = happyGoto action_23
action_107 (18) = happyGoto action_24
action_107 (19) = happyGoto action_25
action_107 (20) = happyGoto action_26
action_107 (21) = happyGoto action_27
action_107 (22) = happyGoto action_133
action_107 (23) = happyGoto action_137
action_107 _ = happyReduce_62

action_108 (29) = happyShift action_29
action_108 (33) = happyShift action_30
action_108 (40) = happyShift action_31
action_108 (53) = happyShift action_32
action_108 (54) = happyShift action_33
action_108 (56) = happyShift action_34
action_108 (60) = happyShift action_35
action_108 (68) = happyShift action_36
action_108 (73) = happyShift action_37
action_108 (75) = happyShift action_38
action_108 (78) = happyShift action_2
action_108 (79) = happyShift action_39
action_108 (80) = happyShift action_40
action_108 (4) = happyGoto action_17
action_108 (5) = happyGoto action_18
action_108 (6) = happyGoto action_19
action_108 (14) = happyGoto action_20
action_108 (15) = happyGoto action_21
action_108 (16) = happyGoto action_22
action_108 (17) = happyGoto action_23
action_108 (18) = happyGoto action_24
action_108 (19) = happyGoto action_25
action_108 (20) = happyGoto action_26
action_108 (21) = happyGoto action_27
action_108 (22) = happyGoto action_136
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (78) = happyShift action_2
action_109 (4) = happyGoto action_135
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (29) = happyShift action_29
action_110 (33) = happyShift action_30
action_110 (40) = happyShift action_31
action_110 (53) = happyShift action_32
action_110 (54) = happyShift action_33
action_110 (56) = happyShift action_34
action_110 (60) = happyShift action_35
action_110 (68) = happyShift action_36
action_110 (73) = happyShift action_37
action_110 (75) = happyShift action_38
action_110 (78) = happyShift action_2
action_110 (79) = happyShift action_39
action_110 (80) = happyShift action_40
action_110 (4) = happyGoto action_17
action_110 (5) = happyGoto action_18
action_110 (6) = happyGoto action_19
action_110 (14) = happyGoto action_20
action_110 (15) = happyGoto action_21
action_110 (16) = happyGoto action_22
action_110 (17) = happyGoto action_23
action_110 (18) = happyGoto action_24
action_110 (19) = happyGoto action_25
action_110 (20) = happyGoto action_26
action_110 (21) = happyGoto action_27
action_110 (22) = happyGoto action_133
action_110 (23) = happyGoto action_134
action_110 _ = happyReduce_62

action_111 (34) = happyShift action_132
action_111 _ = happyFail (happyExpListPerState 111)

action_112 (42) = happyShift action_131
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (78) = happyShift action_2
action_113 (4) = happyGoto action_65
action_113 (24) = happyGoto action_130
action_113 _ = happyReduce_65

action_114 (46) = happyShift action_129
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (63) = happyShift action_127
action_115 (65) = happyShift action_128
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (64) = happyShift action_117
action_116 (12) = happyGoto action_126
action_116 (13) = happyGoto action_116
action_116 _ = happyReduce_25

action_117 (29) = happyShift action_29
action_117 (33) = happyShift action_30
action_117 (40) = happyShift action_31
action_117 (53) = happyShift action_32
action_117 (54) = happyShift action_33
action_117 (56) = happyShift action_34
action_117 (60) = happyShift action_35
action_117 (68) = happyShift action_36
action_117 (73) = happyShift action_37
action_117 (75) = happyShift action_38
action_117 (78) = happyShift action_2
action_117 (79) = happyShift action_39
action_117 (80) = happyShift action_40
action_117 (4) = happyGoto action_17
action_117 (5) = happyGoto action_18
action_117 (6) = happyGoto action_19
action_117 (14) = happyGoto action_20
action_117 (15) = happyGoto action_21
action_117 (16) = happyGoto action_22
action_117 (17) = happyGoto action_23
action_117 (18) = happyGoto action_24
action_117 (19) = happyGoto action_25
action_117 (20) = happyGoto action_26
action_117 (21) = happyGoto action_27
action_117 (22) = happyGoto action_125
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (34) = happyShift action_124
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (8) = happyGoto action_123
action_119 _ = happyReduce_5

action_120 (45) = happyShift action_122
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_8

action_122 (29) = happyShift action_29
action_122 (33) = happyShift action_30
action_122 (40) = happyShift action_31
action_122 (53) = happyShift action_32
action_122 (54) = happyShift action_33
action_122 (56) = happyShift action_34
action_122 (60) = happyShift action_35
action_122 (68) = happyShift action_36
action_122 (73) = happyShift action_37
action_122 (75) = happyShift action_38
action_122 (78) = happyShift action_2
action_122 (79) = happyShift action_39
action_122 (80) = happyShift action_40
action_122 (4) = happyGoto action_17
action_122 (5) = happyGoto action_18
action_122 (6) = happyGoto action_19
action_122 (14) = happyGoto action_20
action_122 (15) = happyGoto action_21
action_122 (16) = happyGoto action_22
action_122 (17) = happyGoto action_23
action_122 (18) = happyGoto action_24
action_122 (19) = happyGoto action_25
action_122 (20) = happyGoto action_26
action_122 (21) = happyGoto action_27
action_122 (22) = happyGoto action_150
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (46) = happyShift action_7
action_123 (55) = happyShift action_8
action_123 (61) = happyShift action_9
action_123 (62) = happyShift action_10
action_123 (65) = happyShift action_149
action_123 (66) = happyShift action_11
action_123 (67) = happyShift action_12
action_123 (69) = happyShift action_13
action_123 (71) = happyShift action_14
action_123 (72) = happyShift action_15
action_123 (74) = happyShift action_16
action_123 (78) = happyShift action_2
action_123 (4) = happyGoto action_5
action_123 (9) = happyGoto action_6
action_123 _ = happyFail (happyExpListPerState 123)

action_124 (8) = happyGoto action_148
action_124 _ = happyReduce_5

action_125 (8) = happyGoto action_147
action_125 _ = happyReduce_5

action_126 _ = happyReduce_24

action_127 (8) = happyGoto action_146
action_127 _ = happyReduce_5

action_128 _ = happyReduce_9

action_129 _ = happyReduce_20

action_130 _ = happyReduce_67

action_131 (75) = happyShift action_145
action_131 _ = happyFail (happyExpListPerState 131)

action_132 _ = happyReduce_37

action_133 (39) = happyShift action_107
action_133 _ = happyReduce_63

action_134 (34) = happyShift action_144
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (70) = happyShift action_143
action_135 _ = happyFail (happyExpListPerState 135)

action_136 (57) = happyShift action_142
action_136 _ = happyFail (happyExpListPerState 136)

action_137 _ = happyReduce_64

action_138 (45) = happyShift action_139
action_138 _ = happyFail (happyExpListPerState 138)

action_139 (29) = happyShift action_29
action_139 (33) = happyShift action_30
action_139 (40) = happyShift action_31
action_139 (53) = happyShift action_32
action_139 (54) = happyShift action_33
action_139 (56) = happyShift action_34
action_139 (60) = happyShift action_35
action_139 (68) = happyShift action_36
action_139 (73) = happyShift action_37
action_139 (75) = happyShift action_38
action_139 (78) = happyShift action_2
action_139 (79) = happyShift action_39
action_139 (80) = happyShift action_40
action_139 (4) = happyGoto action_17
action_139 (5) = happyGoto action_18
action_139 (6) = happyGoto action_19
action_139 (14) = happyGoto action_20
action_139 (15) = happyGoto action_21
action_139 (16) = happyGoto action_22
action_139 (17) = happyGoto action_23
action_139 (18) = happyGoto action_24
action_139 (19) = happyGoto action_25
action_139 (20) = happyGoto action_26
action_139 (21) = happyGoto action_27
action_139 (22) = happyGoto action_141
action_139 _ = happyFail (happyExpListPerState 139)

action_140 _ = happyReduce_43

action_141 (57) = happyShift action_157
action_141 _ = happyFail (happyExpListPerState 141)

action_142 _ = happyReduce_28

action_143 (29) = happyShift action_29
action_143 (33) = happyShift action_30
action_143 (40) = happyShift action_31
action_143 (53) = happyShift action_32
action_143 (54) = happyShift action_33
action_143 (56) = happyShift action_34
action_143 (60) = happyShift action_35
action_143 (68) = happyShift action_36
action_143 (73) = happyShift action_37
action_143 (75) = happyShift action_38
action_143 (78) = happyShift action_2
action_143 (79) = happyShift action_39
action_143 (80) = happyShift action_40
action_143 (4) = happyGoto action_155
action_143 (5) = happyGoto action_18
action_143 (6) = happyGoto action_19
action_143 (14) = happyGoto action_20
action_143 (15) = happyGoto action_21
action_143 (16) = happyGoto action_22
action_143 (17) = happyGoto action_23
action_143 (18) = happyGoto action_24
action_143 (19) = happyGoto action_25
action_143 (20) = happyGoto action_26
action_143 (21) = happyGoto action_27
action_143 (22) = happyGoto action_156
action_143 _ = happyFail (happyExpListPerState 143)

action_144 _ = happyReduce_36

action_145 (29) = happyShift action_29
action_145 (33) = happyShift action_30
action_145 (40) = happyShift action_31
action_145 (53) = happyShift action_32
action_145 (54) = happyShift action_33
action_145 (56) = happyShift action_34
action_145 (60) = happyShift action_35
action_145 (68) = happyShift action_36
action_145 (73) = happyShift action_37
action_145 (75) = happyShift action_38
action_145 (78) = happyShift action_2
action_145 (79) = happyShift action_39
action_145 (80) = happyShift action_40
action_145 (4) = happyGoto action_17
action_145 (5) = happyGoto action_18
action_145 (6) = happyGoto action_19
action_145 (14) = happyGoto action_20
action_145 (15) = happyGoto action_21
action_145 (16) = happyGoto action_22
action_145 (17) = happyGoto action_23
action_145 (18) = happyGoto action_24
action_145 (19) = happyGoto action_25
action_145 (20) = happyGoto action_26
action_145 (21) = happyGoto action_27
action_145 (22) = happyGoto action_154
action_145 _ = happyFail (happyExpListPerState 145)

action_146 (46) = happyShift action_7
action_146 (55) = happyShift action_8
action_146 (61) = happyShift action_9
action_146 (62) = happyShift action_10
action_146 (65) = happyShift action_153
action_146 (66) = happyShift action_11
action_146 (67) = happyShift action_12
action_146 (69) = happyShift action_13
action_146 (71) = happyShift action_14
action_146 (72) = happyShift action_15
action_146 (74) = happyShift action_16
action_146 (78) = happyShift action_2
action_146 (4) = happyGoto action_5
action_146 (9) = happyGoto action_6
action_146 _ = happyFail (happyExpListPerState 146)

action_147 (46) = happyShift action_7
action_147 (55) = happyShift action_8
action_147 (61) = happyShift action_9
action_147 (62) = happyShift action_10
action_147 (66) = happyShift action_11
action_147 (67) = happyShift action_12
action_147 (69) = happyShift action_13
action_147 (71) = happyShift action_14
action_147 (72) = happyShift action_15
action_147 (74) = happyShift action_16
action_147 (78) = happyShift action_2
action_147 (4) = happyGoto action_5
action_147 (9) = happyGoto action_6
action_147 _ = happyReduce_26

action_148 (46) = happyShift action_7
action_148 (55) = happyShift action_8
action_148 (61) = happyShift action_9
action_148 (62) = happyShift action_10
action_148 (65) = happyShift action_152
action_148 (66) = happyShift action_11
action_148 (67) = happyShift action_12
action_148 (69) = happyShift action_13
action_148 (71) = happyShift action_14
action_148 (72) = happyShift action_15
action_148 (74) = happyShift action_16
action_148 (78) = happyShift action_2
action_148 (4) = happyGoto action_5
action_148 (9) = happyGoto action_6
action_148 _ = happyFail (happyExpListPerState 148)

action_149 _ = happyReduce_13

action_150 (8) = happyGoto action_151
action_150 _ = happyReduce_5

action_151 (46) = happyShift action_7
action_151 (55) = happyShift action_8
action_151 (61) = happyShift action_9
action_151 (62) = happyShift action_10
action_151 (65) = happyShift action_161
action_151 (66) = happyShift action_11
action_151 (67) = happyShift action_12
action_151 (69) = happyShift action_13
action_151 (71) = happyShift action_14
action_151 (72) = happyShift action_15
action_151 (74) = happyShift action_16
action_151 (78) = happyShift action_2
action_151 (4) = happyGoto action_5
action_151 (9) = happyGoto action_6
action_151 _ = happyFail (happyExpListPerState 151)

action_152 _ = happyReduce_16

action_153 _ = happyReduce_10

action_154 (77) = happyShift action_160
action_154 _ = happyFail (happyExpListPerState 154)

action_155 (56) = happyShift action_92
action_155 (57) = happyShift action_159
action_155 _ = happyReduce_31

action_156 (45) = happyShift action_158
action_156 _ = happyFail (happyExpListPerState 156)

action_157 _ = happyReduce_39

action_158 (29) = happyShift action_29
action_158 (33) = happyShift action_30
action_158 (40) = happyShift action_31
action_158 (53) = happyShift action_32
action_158 (54) = happyShift action_33
action_158 (56) = happyShift action_34
action_158 (60) = happyShift action_35
action_158 (68) = happyShift action_36
action_158 (73) = happyShift action_37
action_158 (75) = happyShift action_38
action_158 (78) = happyShift action_2
action_158 (79) = happyShift action_39
action_158 (80) = happyShift action_40
action_158 (4) = happyGoto action_17
action_158 (5) = happyGoto action_18
action_158 (6) = happyGoto action_19
action_158 (14) = happyGoto action_20
action_158 (15) = happyGoto action_21
action_158 (16) = happyGoto action_22
action_158 (17) = happyGoto action_23
action_158 (18) = happyGoto action_24
action_158 (19) = happyGoto action_25
action_158 (20) = happyGoto action_26
action_158 (21) = happyGoto action_27
action_158 (22) = happyGoto action_162
action_158 _ = happyFail (happyExpListPerState 158)

action_159 _ = happyReduce_30

action_160 _ = happyReduce_40

action_161 _ = happyReduce_12

action_162 (57) = happyShift action_163
action_162 _ = happyFail (happyExpListPerState 162)

action_163 _ = happyReduce_29

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn4
		 (Ident happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn5
		 ((read ( happy_var_1)) :: Integer
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyTerminal (PT _ (TL happy_var_1)))
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (AbsRomeo.Prog () (reverse happy_var_1)
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  8 happyReduction_5
happyReduction_5  =  HappyAbsSyn8
		 ([]
	)

happyReduce_6 = happySpecReduce_2  8 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  9 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn9
		 (AbsRomeo.Empty ()
	)

happyReduce_8 = happyReduce 4 9 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.Ass () happy_var_1 happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 5 9 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.Cond () happy_var_2 (reverse happy_var_3) happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 7 9 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.CondElse () happy_var_2 (reverse happy_var_3) happy_var_4 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 9 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.While () happy_var_2 (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 8 9 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_7) `HappyStk`
	(HappyAbsSyn22  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.For () happy_var_2 happy_var_4 happy_var_6 (reverse happy_var_7)
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 6 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.ForIn () happy_var_2 happy_var_4 (reverse happy_var_5)
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn9
		 (AbsRomeo.Break ()
	)

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 _
	_
	 =  HappyAbsSyn9
		 (AbsRomeo.Cont ()
	)

happyReduce_16 = happyReduce 7 9 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.Func () happy_var_2 happy_var_4 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_3  9 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (AbsRomeo.Ret () happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  9 happyReduction_18
happyReduction_18 _
	_
	 =  HappyAbsSyn9
		 (AbsRomeo.VRet ()
	)

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (AbsRomeo.Yeld () happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 5 9 happyReduction_20
happyReduction_20 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AbsRomeo.Print () happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn10
		 (AbsRomeo.Init () happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 ((:[]) happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  12 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (AbsRomeo.CondElIfs () happy_var_1 happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_0  12 happyReduction_25
happyReduction_25  =  HappyAbsSyn12
		 (AbsRomeo.NilElif ()
	)

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn8  happy_var_3)
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (AbsRomeo.CondElIf () happy_var_2 (reverse happy_var_3)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (AbsRomeo.Lis1 () happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 14 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AbsRomeo.Lis2 () happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 9 14 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AbsRomeo.Lis3 () happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 7 14 happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (AbsRomeo.Lis4 () happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_1  15 happyReduction_31
happyReduction_31 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.EVar () happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  15 happyReduction_32
happyReduction_32 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.ELitInt () happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  15 happyReduction_33
happyReduction_33 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.ELitLis () happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  15 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn15
		 (AbsRomeo.ELitTrue ()
	)

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn15
		 (AbsRomeo.ELitFalse ()
	)

happyReduce_36 = happyReduce 5 15 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AbsRomeo.EApp () happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 4 15 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AbsRomeo.EGen () happy_var_3
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_2  15 happyReduction_38
happyReduction_38 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (AbsRomeo.ETake () happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happyReduce 6 15 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AbsRomeo.ESlice () happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 7 15 happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AbsRomeo.EAnon () happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_1  15 happyReduction_41
happyReduction_41 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.EString () happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  15 happyReduction_42
happyReduction_42 _
	(HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happyReduce 4 16 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (AbsRomeo.EElem () happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_2  16 happyReduction_44
happyReduction_44 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (AbsRomeo.Neg () happy_var_2
	)
happyReduction_44 _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  16 happyReduction_45
happyReduction_45 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (AbsRomeo.Not () happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  16 happyReduction_46
happyReduction_46 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  17 happyReduction_47
happyReduction_47 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.Pow () happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  17 happyReduction_48
happyReduction_48 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  18 happyReduction_49
happyReduction_49 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.EMul () happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  18 happyReduction_50
happyReduction_50 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.EDiv () happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  18 happyReduction_51
happyReduction_51 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.EMod () happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  18 happyReduction_52
happyReduction_52 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  19 happyReduction_53
happyReduction_53 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.EAdd () happy_var_1 happy_var_3
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  19 happyReduction_54
happyReduction_54 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.ESub () happy_var_1 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  19 happyReduction_55
happyReduction_55 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  20 happyReduction_56
happyReduction_56 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn28  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.ERel () happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  20 happyReduction_57
happyReduction_57 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  21 happyReduction_58
happyReduction_58 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsRomeo.EAnd () happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  21 happyReduction_59
happyReduction_59 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  22 happyReduction_60
happyReduction_60 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn22
		 (AbsRomeo.EOr () happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  22 happyReduction_61
happyReduction_61 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_0  23 happyReduction_62
happyReduction_62  =  HappyAbsSyn23
		 ([]
	)

happyReduce_63 = happySpecReduce_1  23 happyReduction_63
happyReduction_63 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 ((:[]) happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  23 happyReduction_64
happyReduction_64 (HappyAbsSyn23  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_0  24 happyReduction_65
happyReduction_65  =  HappyAbsSyn24
		 ([]
	)

happyReduce_66 = happySpecReduce_1  24 happyReduction_66
happyReduction_66 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn24
		 ((:[]) happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  24 happyReduction_67
happyReduction_67 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn24
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  25 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn25
		 (AbsRomeo.Eq ()
	)

happyReduce_69 = happySpecReduce_1  25 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn25
		 (AbsRomeo.PlEq ()
	)

happyReduce_70 = happySpecReduce_1  25 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn25
		 (AbsRomeo.MnEq ()
	)

happyReduce_71 = happySpecReduce_1  25 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn25
		 (AbsRomeo.MulEq ()
	)

happyReduce_72 = happySpecReduce_1  25 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn25
		 (AbsRomeo.DivEq ()
	)

happyReduce_73 = happySpecReduce_1  25 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn25
		 (AbsRomeo.PowEq ()
	)

happyReduce_74 = happySpecReduce_1  26 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn26
		 (AbsRomeo.Plus ()
	)

happyReduce_75 = happySpecReduce_1  26 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn26
		 (AbsRomeo.Minus ()
	)

happyReduce_76 = happySpecReduce_1  27 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn27
		 (AbsRomeo.Times ()
	)

happyReduce_77 = happySpecReduce_1  27 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn27
		 (AbsRomeo.Div ()
	)

happyReduce_78 = happySpecReduce_1  27 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn27
		 (AbsRomeo.Mod ()
	)

happyReduce_79 = happySpecReduce_1  28 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn28
		 (AbsRomeo.LTH ()
	)

happyReduce_80 = happySpecReduce_1  28 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn28
		 (AbsRomeo.LE ()
	)

happyReduce_81 = happySpecReduce_1  28 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn28
		 (AbsRomeo.GTH ()
	)

happyReduce_82 = happySpecReduce_1  28 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn28
		 (AbsRomeo.GE ()
	)

happyReduce_83 = happySpecReduce_1  28 happyReduction_83
happyReduction_83 _
	 =  HappyAbsSyn28
		 (AbsRomeo.EQU ()
	)

happyReduce_84 = happySpecReduce_1  28 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn28
		 (AbsRomeo.NE ()
	)

happyNewToken action sts stk [] =
	action 81 81 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 29;
	PT _ (TS _ 2) -> cont 30;
	PT _ (TS _ 3) -> cont 31;
	PT _ (TS _ 4) -> cont 32;
	PT _ (TS _ 5) -> cont 33;
	PT _ (TS _ 6) -> cont 34;
	PT _ (TS _ 7) -> cont 35;
	PT _ (TS _ 8) -> cont 36;
	PT _ (TS _ 9) -> cont 37;
	PT _ (TS _ 10) -> cont 38;
	PT _ (TS _ 11) -> cont 39;
	PT _ (TS _ 12) -> cont 40;
	PT _ (TS _ 13) -> cont 41;
	PT _ (TS _ 14) -> cont 42;
	PT _ (TS _ 15) -> cont 43;
	PT _ (TS _ 16) -> cont 44;
	PT _ (TS _ 17) -> cont 45;
	PT _ (TS _ 18) -> cont 46;
	PT _ (TS _ 19) -> cont 47;
	PT _ (TS _ 20) -> cont 48;
	PT _ (TS _ 21) -> cont 49;
	PT _ (TS _ 22) -> cont 50;
	PT _ (TS _ 23) -> cont 51;
	PT _ (TS _ 24) -> cont 52;
	PT _ (TS _ 25) -> cont 53;
	PT _ (TS _ 26) -> cont 54;
	PT _ (TS _ 27) -> cont 55;
	PT _ (TS _ 28) -> cont 56;
	PT _ (TS _ 29) -> cont 57;
	PT _ (TS _ 30) -> cont 58;
	PT _ (TS _ 31) -> cont 59;
	PT _ (TS _ 32) -> cont 60;
	PT _ (TS _ 33) -> cont 61;
	PT _ (TS _ 34) -> cont 62;
	PT _ (TS _ 35) -> cont 63;
	PT _ (TS _ 36) -> cont 64;
	PT _ (TS _ 37) -> cont 65;
	PT _ (TS _ 38) -> cont 66;
	PT _ (TS _ 39) -> cont 67;
	PT _ (TS _ 40) -> cont 68;
	PT _ (TS _ 41) -> cont 69;
	PT _ (TS _ 42) -> cont 70;
	PT _ (TS _ 43) -> cont 71;
	PT _ (TS _ 44) -> cont 72;
	PT _ (TS _ 45) -> cont 73;
	PT _ (TS _ 46) -> cont 74;
	PT _ (TS _ 47) -> cont 75;
	PT _ (TS _ 48) -> cont 76;
	PT _ (TS _ 49) -> cont 77;
	PT _ (TV happy_dollar_dollar) -> cont 78;
	PT _ (TI happy_dollar_dollar) -> cont 79;
	PT _ (TL happy_dollar_dollar) -> cont 80;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 81 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
