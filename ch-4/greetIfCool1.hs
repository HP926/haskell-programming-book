module GreetIfCool1 where

greetIfCool1 :: String -> IO ()
greetIfCool1 coolness =
  if cool 
    then putStrLn "eyyy!!"
  else
    putStrLn "pshh"
  where cool =
          coolness == "im cool"


tupFunc :: (Int, [a])
        -> (Int, [a])
        -> (Int, [a])
tupFunc (a, b) (c, d) = 
  ((a + c), (b ++ d))


myAbs :: Integer -> Integer
myAbs x = 
  if x > 0 
    then x 
  else abs x


func :: (a, b) -> (c, d) -> ((b, d), (a, c)) 
func firstTup secondTup = ((snd firstTup, snd secondTup), (fst firstTup, fst secondTup))

-- firstTup = (1,2)
-- secondTup = (3,4)


x :: Int -> Int -> Int
x = (+)

func2 :: Foldable t => t a -> Int
func2 xs = x w 1
  where w = length xs