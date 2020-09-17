module Examples where
-- Recursion

fourFactorial :: Integer 
fourFactorial = 4 * 3 * 2 * 1


factorial :: Integer -> Integer 
factorial 0 = 1
factorial n = n * factorial (n - 1)


inc :: Num a => a -> a 
inc = (+1)

three :: Integer
three = inc . inc . inc $ 0
-- different syntax, same thing 

three' :: Integer
three' = (inc . inc . inc) 0

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times -1) n)
-- incTimes 1 2 = 1 + (incTimes (1 -1) 2)

applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)

-- Same as above but with composition
applyTimes' :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes' 0 f b = b
applyTimes' n f b =
  f . applyTimes (n-1) f $ b

incTimes' :: (Eq a, Num a) => a -> a -> a 
incTimes' times n = applyTimes times (+1) n

-- Exception Example - error
func :: Bool -> Int
func True = error "blah"
func False = 0


-- func with Maybe
func1 :: Bool -> Maybe Int
func1 False = Just 0
func1 _     = Nothing  

-- Named arguments, type synonyms
type Numerator = Integer
type Denominator = Integer
type Quotient = Integer

dividedBy :: Numerator
          -> Denominator
          -> Quotient 
dividedBy = div

-- change type signature allows polymorphic
dividedBy' :: Integral a => a -> a -> (a, a) 
dividedBy' num denom = go num denom 0
  where go n d count
         | n < d = (count, n)
         | otherwise =
          go (n - d) d (count + 1)

