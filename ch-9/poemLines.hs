module PoemLines where

import Debug.Trace
firstSen = "Tyger Tyger, burning bright\n" 
secondSen = "In the forests of the night\n" 
thirdSen = "What immortal hand or eye\n" 
fourthSen = "Could frame thy fearful symmetry?"

sentences :: [Char]
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen
     -- putStrLn sentences -- should print
     -- Tyger Tyger, burning bright
     -- In the forests of the night
     -- What immortal hand or eye
     -- Could frame thy fearful symmetry?

-- Implement this
myLines :: String -> [String] 
-- myLines []        = []
-- myLines ('\n':xs) = myLines xs
-- myLines (x)       = t : myLines d
--   where
--     t = takeWhile (/= '\n') x
--     d = dropWhile (/= '\n') x
myLines s = myHelperFunc '\n' s
  

myWords :: String -> [String] 
myWords s = myHelperFunc ' ' s
-- myWords []       = []
-- myWords (' ':s)  = myWords s
-- myWords s        = t : myWords d
--   where
--     t = takeWhile (/= ' ') s
--     d = dropWhile (/= ' ') s

myHelperFunc :: Char -> String -> [String]
myHelperFunc _ [] = []
myHelperFunc char s@(x:xs) = 
  if char == x
    then myHelperFunc char xs
  else 
    t : myHelperFunc char d
  where
    t = takeWhile (/= char) s
    d = dropWhile (/= char) s


shouldEqual :: [[Char]]
shouldEqual =
       [ "Tyger Tyger, burning bright"
       , "In the forests of the night"
       , "What immortal hand or eye"
       , "Could frame thy fearful symmetry?"
       ]



-- The main function here is a small test -- to ensure you've written your function -- correctly.
main :: IO ()
main = print $
       "Are they equal? " ++ show (myLines sentences == shouldEqual)





-- 