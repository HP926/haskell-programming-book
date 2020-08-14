module Exercises where

myConcat :: String -> String
myConcat x = x ++ "!" 

take5th :: [Char] -> Char
take5th x = x !! 4

dropFirsth10 :: [Char] -> String
dropFirsth10 x = drop 9 x 

-- a. "Curry is awesome" ++ "!"
-- b. "Curry is awesome" !! 4
-- c. drop 9 "Curry is awesome!"


thirdLetter :: String -> Char
thirdLetter x =  x !! 3

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

rvrs :: String -> String
rvrs x = let awesome = drop 9 x
             curryIs = take 8 x
             is = drop 6 curryIs
             curry = take 6 curryIs
          in awesome ++ " " ++ is ++ " " ++ curry

rvrs2 :: String -> String
rvrs2 x = let curry = take 5 x
              is = take 4 (drop 5 x) -- Include the spaces around `is`
              awesome = take 7 (drop 9 x)
            in awesome ++ is ++ curry