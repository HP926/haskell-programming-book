module MyWords where

-- 1. Using takeWhile and dropWhile, 
-- write a function that takes a string 
-- and returns a list of strings, 
-- using spaces to separate the 
-- elements of the string into words, 
-- as in the following sample:

--  Prelude> myWords "sheryl wants fun"
--      ["wallfish", "wants", "fun"]

myWords :: String -> [String] 
myWords []       = []
myWords (' ':s)  = myWords s
myWords s        = t : myWords d
  where
    t = takeWhile (/= ' ') s
    d = dropWhile (/= ' ') s

