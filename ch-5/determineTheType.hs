{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

example :: Num p => p
example = 1

functionH :: [a] -> a
functionH (x:_) = x

functionC :: Ord a => a -> a -> Bool
functionC x y =
  if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y

myFunc :: (x -> y) -> (y -> z)
       -> c
       -> (a, x) 
       -> (a, z)
myFunc xToY yToZ _ (a, x) = 
  (a, (yToZ (xToY x)))