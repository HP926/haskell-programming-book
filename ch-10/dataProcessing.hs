module DataProcessing where
import Data.Time

data DatabaseItem =
  DbString String | DbNumber Integer | DbDate UTCTime deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbNumber 9001
  , DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
  , DbString "Hello, world!" 
  , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))
  , DbNumber 9006
  , DbNumber 9024
  ]

isDbDate :: DatabaseItem -> [UTCTime] -> [UTCTime]
isDbDate item times = case item of 
  DbDate time -> times ++ [time] 
  _ -> times

-- 1. Write a function that filters for DbDate values and returns a list
-- of the UTCTime values inside them.
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr isDbDate []

isDbNum :: DatabaseItem -> [Integer] -> [Integer]
isDbNum (DbNumber x) xs = x:xs
isDbNum _ xs = xs

-- 2. Write a function that filters for DbNumber values and returns a list
-- of the Integer values inside them.

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr isDbNum []

-- 3. Write a function that gets the most recent date.
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- 4. Write a function that sums all of the DbNumber values
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- 5. Write a function that gets the average of the DbNumber values.
avgDb :: [DatabaseItem] -> Double
avgDb = avg . filterDbNumber
    where avg :: [Integer] -> Double
          avg xs = s / l
              where s = fromIntegral $ sum xs
                    l = fromIntegral $ length xs