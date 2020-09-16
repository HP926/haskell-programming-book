module Examples where


myNum :: Integer
myNum = 1

myVal = myNum

myVal2 :: p -> Integer
myVal2 f = myNum


-- We can tell it’s not a function because no parameters are named
myNum2 :: Num a => a 
myNum2= 2

--  function type is Num a => a -> a
myVal3 :: Num a => a -> a 
myVal3 f = f + myNum2

stillAFunction :: [a] -> [a] -> [a] -> [a] 
stillAFunction a b c = a ++ b ++ c

bindExp :: Integer -> String 
bindExp x =
  let 
    y = 5 
  in
    "the integer was: " ++ show x ++ " and y was: " ++ show y

-- Pattern Matching
isItTwo :: Integer -> Bool 
isItTwo 2 = True
isItTwo _ = False

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

fsameAsAbove :: (a, b) -> (c, d) -> ((b, d), (a, c)) 
fsameAsAbove (a, b) (c, d) = ((b, d), (a, c))

x :: Integer
x = 2

myFunc :: (Eq a, Num a) => a -> [Char]
myFunc x = 
  if x + 1 == 1 
    then "AWESOME" 
  else "wut"

myFuncAsCase :: (Eq a, Num a) => a -> [Char]
myFuncAsCase x = 
  case x + 1 == 1 of
    True -> "Awesome"
    False -> "Wut"

palindrome :: Eq a => [a] -> [Char]
palindrome xs =
  case xs == reverse xs of
    True -> "yes" 
    False -> "no"

palindrome' :: Eq a => [a] -> [Char]
palindrome' xs = 
  case y of
    True -> "yes"
    False -> "no"
  where y = (xs == (reverse xs))


returnLast :: a -> b -> c -> d -> d 
returnLast _ _ _ d = d

--  explicit currying
returnLast' :: a -> (b -> (c -> (d -> d))) 
returnLast' _ _ _ d = d

returnAfterApply :: (a -> b) -> a -> c -> b 
returnAfterApply f a c = f a

data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO () 
reportBoss e e' =
  putStrLn $ show e ++
             " is the boss of " ++
             show e'

-- employeeRank :: Employee
--              -> Employee
--              -> IO () 
             
-- employeeRank e e' =
--   case compare e e' of
--     GT -> reportBoss e e' 
--     EQ -> putStrLn "Neither employee\ \ is the boss"
--     LT -> (flip reportBoss) e e'

codersRuleCEOsDrool :: Employee
                    -> Employee
                    -> Ordering
codersRuleCEOsDrool Coder Coder = EQ 
codersRuleCEOsDrool Coder _ = GT 
codersRuleCEOsDrool _ Coder = LT 
codersRuleCEOsDrool e e' =
  compare e e'


employeeRank :: ( Employee 
               -> Employee
               -> Ordering ) 
               -> Employee
               -> Employee
               -> IO ()
employeeRank f e e' = 
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither employee\
                   \ is the boss"
    LT -> (flip reportBoss) e e'

dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10
-- dodgy = (\x -> (\y -> x + y)) * 10

oneIsOne :: Integer -> Integer
oneIsOne = dodgy 1
-- oneIsOne x = dodgy 1 (x * 10)

oneIsTwo :: Integer -> Integer
oneIsTwo = (flip dodgy) 2
-- oneIsTwo x = dodgy x (2 * 10)


myAbs :: Integer -> Integer 
myAbs x
  | x < 0 = (-x) 
  | otherwise = x


bloodNa :: Integer -> String 
bloodNa x
  | x < 135 = "too low"
  | x > 145 = "too high"
  | otherwise = "just right"

isRight :: (Num a, Eq a) => a -> a -> a -> String
isRight a b c
  | a^2 + b^2 == c^2 = "RIGHT ON" 
  | otherwise = "not right"

dogYrs :: Integer -> Integer 
dogYrs x
  | x <= 0 = 0
  | x <= 1 = x * 15
  | x <= 2 = x * 12
  | x <= 4 = x * 8
  | otherwise = x * 6

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x 
  | y >= 0.9  = 'A' 
  | y >= 0.8  = 'B' 
  | y >= 0.7  = 'C' 
  | y >= 0.59 = 'D' 
  | y < 0.59  = 'F' 
  where y = x / 100

avgGradeWithOtherwise ::(Fractional a, Ord a) => a -> Char
avgGradeWithOtherwise x 
  | y >= 0.7   = 'C' 
  | otherwise  = 'F'
  | y >= 0.9   = 'A' 
  | y >= 0.8   = 'B' 
  
  | y >= 0.59  = 'D' 
  where y = x / 100
  

pal :: Eq a => [a] -> Bool
pal xs
  | xs == reverse xs = True 
  | otherwise = False

(.) :: (t1 -> t2) -> (t3 -> t1) -> t3 -> t2
(f . g) x = f (g x)


-- funcWithComposition x = take 5 . enumFrom $ x
