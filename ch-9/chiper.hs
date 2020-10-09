module Chiper where

-- A Caesar cipher is a simple substitution cipher, 
-- in which each letter is replaced by the letter 
-- that is a fixed number of places down the alphabet from it. 
-- You will find variations on this all over the place
-- — you can shift leftward or rightward, for any number 
-- of spaces. A rightward shift of 3 means that ’A’ will become ’D’
-- and ’B’ will become ’E,’ for example. If you did a leftward 
-- shift of 5, then ’a’ would become ’v’ and so forth.

-- write a basic Caesar cipher that shifts rightward

import Data.Char ( ord, chr, isUpper )

toCeasar :: String -> Int -> String
toCeasar "" _ = ""
toCeasar (x:xs) i =
  let
    base
      | isUpper x = ord 'A'
      | otherwise = ord 'a'
    x' = chr $ (mod ((ord x + i) - base) 26) + base
  in
    x' : toCeasar xs i

unCeasar :: String -> Int -> String
unCeasar "" _ = ""
unCeasar (x:xs) i =
  let
    base
      | isUpper x = ord 'A'
      | otherwise = ord 'a'
    x' = chr $ (mod ((ord x - i) - base) 26) + base
  in
    x' : unCeasar xs i