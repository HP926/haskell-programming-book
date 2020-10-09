module Exercises where

import Data.Char ( isUpper, toUpper )

-- 2. Given the following behaviors, which would 
-- we use to write a function that filters all 
-- the uppercase letters out of a String? Write 
-- that function such that, given the input “HbEfLrLxO,”
--  your function will return “HELLO.”

filterUpper :: String -> String
filterUpper "" = ""
filterUpper s = filter isUpper s

-- 3. Write a function that will capitalize the 
-- first letter of a string and return the 
-- entire string. For example, if given the argument
-- “julie,” it will return “Julie.”

capFirstLetter :: String -> String
capFirstLetter "" = ""
capFirstLetter (x:xs) = toUpper x : xs 


-- 4. Now make a new version of that function that is 
-- recursive such that if you give it the input 
-- “woot” it will holler back at you “WOOT.” 
-- The type signature won’t change, but you will want to
-- add a base case.

capAllLetters :: String -> String
capAllLetters "" = ""
capAllLetters (x:xs) = toUpper x : capAllLetters xs

-- 5. To do the final exercise in this section, 
-- we’ll need another standard function for 
-- lists called head. Query the type of head and 
-- experiment with it to see what it does. 
-- Now write a function that will capitalize the 
-- first letter of a String and return only that 
-- letter as the result.

capHead :: String -> Char
capHead s = (toUpper (head s))