module Examples where

myHead :: [a] -> a
myHead (x : _) = x

-- with empty list
myHead' :: [a] -> Maybe a
myHead' []       = Nothing
myHead' (x : _) = Just x

myTail :: [a] -> [a]
myTail []      = []
myTail (_ : xs) = xs

safeTail :: [a] -> Maybe [a] 
safeTail []     = Nothing
safeTail (x:[]) = Nothing
safeTail (_:xs) = Just xs

myFilter :: String -> [String]
myFilter s = [x | x <- words s, notElem x ["the", "a", "same"]]

mySum :: [Int] -> Int
mySum []     = 0
mySum (x:xs) = x + mySum xs

myEvens :: [Int] -> [Int]
myEvens []     = []
myEvens (x:xs)
  | mod x 2 == 0 = x : myEvens xs
  | otherwise    = myEvens xs

addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [ x+y | (x,y) <- xs ]

-- check if element is in a list
inList :: (Eq a ) => a -> [a] -> Bool
inList _ []   = False
inList c (x:xs) = (x == c) || (elem c xs) 

-- removes duplicates
myNub :: (Eq a) => [a] -> [a]
myNub [] = []
myNub (x:xs)
  | elem x xs = myNub xs
  | otherwise = x : myNub xs

isAsc :: [Int] -> Bool
isAsc []       = True
isAsc [x]      = True
isAsc (x:y:xs) = 
  (x <= y) && isAsc (y:xs)

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = [] 
myZip _ [] = [] 
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

myZip' :: [a] -> [b] -> [(a, b)]
myZip' = myZipWith (,)