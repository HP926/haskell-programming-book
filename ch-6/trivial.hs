module Trivial where

data Trivial =
  Trivial'

instance Eq Trivial where
  Trivial' == Trivial' = True

-- single quote is showing that "data Trivial" can have a value of anything
-- the value does not have to have the same name

data DayOfWeek =
  Mon | Tue | Weds | Thu | Fri | Sat | Sun
  deriving (Show)

instance Ord DayOfWeek where 
  compare Fri Fri = EQ
  compare Fri _   = GT
  compare _ Fri   = LT 
  compare _ _     = EQ

data Date = 
  Date DayOfWeek Int 

instance Eq DayOfWeek where
  (==) Mon Mon   = True
  (==) Tue Tue   = True
  (==) Weds Weds = True
  (==) Thu Thu   = True
  (==) Fri Fri   = True
  (==) Sat Sat   = True
  (==) Sun Sun   = True
  (==) _ _       = False

instance Eq Date where
  (==) (Date weekday dayOfMonth)
       (Date weekday' dayOfMonth') =
      weekday == weekday' 
   && dayOfMonth == dayOfMonth'

-- In the Eq instance for Date, we didn’t recapitulate how equality for DayOfWeek and Int values worked; 
-- we simply said that the dates were equal if all of their constituent values were equal. 
-- Note, also, that the compiler already expects the arguments of Date to be a DayOfWeek value and an Int so we do not need to specify that. 
-- Based on what it knows about those three types, this is enough information for us to test Date values for equality.

func :: Int -> Bool
func 2 = True
func _ = False

data Identity a =
  Identity a 

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

-- instance Ord a => Eq (Identity a) where 
--   (==) (Identity v) (Identity v') = compare v v' == EQ

data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn a) (TisAn a') = a == a'

data TwoIntegers = 
  Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') = 
    a == a' && b == b' 


data StringOrInt = 
  TisAnInt Int | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt a) (TisAnInt a')     = a == a'
  (==) (TisAString a) (TisAString a') = a == a'
  (==) _ _                            = False


data Pair a =
  Pair a a

instance Eq a => Eq (Pair a ) where 
  (==) (Pair a b) (Pair a' b') = a == a' &&  b == b'


data Tuple a b = 
  Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b') = a == a' && b == b'


data Which a = 
  ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne a) (ThisOne a') = a == a'
  (==) (ThatOne a) (ThatOne a') = a == a'
  (==) _ _                      = False

data EitherOr a b = 
  Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a')     = a == a'
  (==) (Goodbye b) (Goodbye b') = b == b'
  (==) _ _                      = False
  

check'  :: Ord a =>  a -> a -> Bool 
check' a a' = a == a'