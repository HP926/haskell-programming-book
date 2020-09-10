module Exercises where

import Data.List (sort)

data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

data Mood = Blah | Woot deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x = 
  if x == Woot
    then Blah
  else x


type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 :: Object -> Sentence
s1 = Sentence "dogs" "drool"

s2 :: Sentence
s2 = Sentence "Julie" "loves" "dogs"



data Rocks = Rocks String deriving (Eq, Show, Ord)
data Yeah = Yeah Bool deriving (Eq, Show, Ord)
data Papu = Papu Rocks Yeah deriving (Eq, Show, Ord)

phew :: Papu
phew = Papu (Rocks "chases") (Yeah True)

truth :: Papu
truth = Papu (Rocks "chomskydoz") (Yeah True)

truth2 :: Papu
truth2 = Papu (Rocks "stuff") (Yeah True)

equalityForall :: Papu -> Papu -> Bool 
equalityForall p p' = p == p'


comparePapus :: Papu -> Papu -> Bool 
comparePapus p p' = p > p'


i :: Num a => a
i = 1

sigmund :: Int -> Int 
sigmund x = myX

myX :: Int
myX = 1 :: Int

jung :: [Int] -> Int
jung xs = head (sort xs)


young :: [Char] -> Char
-- young :: Ord a => [a] -> a
young xs = head (sort xs)


chk :: Eq b => (a -> b) -> a -> b -> Bool 
chk func a b = func a == b