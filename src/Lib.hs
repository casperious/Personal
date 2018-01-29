module Lib
    (Tree(TOp,TInt)
    ,swap
    ,calc) where

data Tree =
    TInt Integer
  | TOp String Tree Tree
  deriving (Eq)

instance Show Tree where
   show (TInt i) = show i
   show (TOp s t1 t2) = "(" ++ s ++ " " ++ show t1 
                            ++ " " ++ show t2 ++ ")"

-- Your code here!
-- Feel free to write helper functions.

swap :: Tree -> Tree
swap t@(TInt _) =  t
--swap (TOp s t1 _) = TOp s _ (swap(t1))
--swap (TOp s _ t2) = TOp s (swap(t2)) _
swap (TOp s t1 t2) = TOp s (swap(t2)) (swap(t1))

calc :: Tree -> Integer
calc (TInt x) = x
--calc (TOp s t1@(TInt x) _) = x
--calc (TOp s _ t2@(TInt x)) = x
--calc (TInt x) = x
calc (TOp s t1 t2) | s == "+" = (calc(t1) + calc(t2))
                   | s == "*" = (calc(t1) * calc(t2))
                   | s == "-" = (calc(t1) - calc(t2))

