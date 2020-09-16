module TupleFunctions where

-- These have the same type
-- (+) is a -> a -> a
addEmUp2 :: Num a => (a, a) -> a
addEmUp2 (x, y) = x + y

-- addemUp2 could also be written like so
addEmUp2Alt :: Num a => (a, a) -> a
addEmUp2Alt tup = (fst tup) + (snd tup)

fst3 :: (a, b, c) -> a 
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x 