module Examples where

xs :: [String]
xs = map show [1..5]

y :: [Char]
y = foldr (\x y -> concat ["(",x,"+",y,")"]) "0" xs


myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = foldr (\x b -> f x || b) False xs

-- Prelude> myAny even [1..]
-- True

const :: a -> b -> a 
const x _ = x

--  Prelude> const 1 2
-- 1