module MoodChange where

data Mood = Blah | Woot deriving Show

-- can only use pattern match if data type is defined

--  _ like else 
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah
