module Arith4 where
roundTrip :: (Show a, Read a) => a -> a 
roundTrip a = read (show a)

roundTrip2 :: (Show a, Read a) => a -> a
roundTrip2 = read . show

roundTrip3 :: (Show a, Read b) => a -> b
roundTrip3 a = read (show a)

main :: IO () 
main = do
print (roundTrip 4) 
print (id 4)