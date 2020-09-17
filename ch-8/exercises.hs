module Exercises where

cattyConny :: String -> String -> String 
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"
-- partial application of cattyConny, 
-- "woops" is used as x argument

frappe :: String -> String
frappe = flippy "haha"
-- partial application of flippy and cattyConny, 
-- "haha takes y argument due to flip"

sumsN :: (Eq a, Num a) => a -> a
sumsN number = go number 0 
  where go sum index
         | index == number = sum
         | otherwise = go (sum + index) (index + 1)

-- multiplies two integral 
-- numbers using recursive summation
-- multiX 5 5 == 5 + 5 + 5 + 5 + 5 
multiN :: (Integral a) => a -> a -> a
multiN num multi = go num multi 0
  where go n m sum
         | m == 0 = sum
         | otherwise = go n (m - 1) (sum + n)



data DividedResult =
  Result Integer | DividedByZero
  deriving Show

dividedBy' :: Integral a => a -> a -> DividedResult
dividedBy' num denom = go num denom 0
  where go n d count
         | d == 0 = DividedByZero
         | d < 0 = case dividedBy' n (-d) of
                     DividedByZero -> DividedByZero
                     Result count      -> Result (-count)
         | n < 0 = case dividedBy' (-n) d of
              DividedByZero -> DividedByZero
              Result count      -> Result (-count)
         | n < d = Result count
         | otherwise = go (n - d) d (count + 1)


mc91 :: (Ord t, Num t) => t -> t
mc91 n
    | n > 100 = n - 10
    | otherwise = mc91 (mc91 (n + 11))
