module Exercises where

-- 1. The following should return x when x is greater than y.
functionC :: Ord p => p -> p -> p
functionC x y = if (x > y) then x else y

functionCase :: Ord a => a -> a -> a 
functionCase x y =
  case x > y of
    True  -> x
    False -> y

-- 2. The following will add 2 to even numbers 
-- and otherwise simply return the input value.

ifEvenAdd2 :: Integral p => p -> p
ifEvenAdd2 n = if even n then (n+2) else n

ifEvenAdd2Case :: Integral p => p -> p
ifEvenAdd2Case n =
  case even n of
    True  -> n + 2
    False -> n

-- 3. The following compares a value, x, 
-- to zero and returns an indicator for 
-- whether x is a postive number or negative number. 
-- But what if x is 0? You may need to play with the 
-- compare function a bit to find what to do.

nums :: (Ord a, Num a, Num p) => a -> p
nums x =
  case compare x 0 of
    LT -> -1 
    GT -> 1
    EQ -> 0


-- 1. The following function returns 
-- the tens digit of an integral argument.

tensDigit :: Integral a => a -> a 
tensDigit x = d
  where xLast = x `div` 10
        d     = xLast `mod` 10

-- a) First, rewrite it using divMod.

mytensDigit :: Integral a => a -> a 
mytensDigit x = d
  where (xLast, _) = x `divMod` 10
        (_, d) = xLast `divMod` 10

--  let’s change it so that we’re getting the 
-- hundreds digit
hunsD :: Integral a => a -> a
hunsD x = d2
  where
    xLast = x `div` 10
    d = xLast `div` 10
    d2 = d `mod` 10

-- 2. Implement the function of the type 
-- a -> a -> Bool -> a once each using a case 
-- expression and once with a guard.

foldBool :: a -> a -> Bool -> a 
foldBool =
  error
    "Error: Need to implement foldBool!"

foldBoolCase :: a -> a -> Bool -> a
foldBoolCase x y cond = 
  case cond of
    True -> x
    False -> y

foldBoolGuard :: a -> a -> Bool -> a
foldBoolGuard x y cond
  | cond == True = x
  | otherwise = y


-- 3. Fill in the definition. 
-- Note that the first argument to our 
-- function is also a function which can be applied to 
-- values. Your second argument is a tuple, w
-- hich can be used for pattern matching:

g :: (a -> b) -> (a, c) -> (b, c) 
g f (a, c) = (f a, c)