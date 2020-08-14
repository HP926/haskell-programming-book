module Print3Broken where

printSecond :: IO ()
printSecond = do
  putStrLn greeting

   
greeting :: [Char]
greeting = "Yarrr"

main :: IO ()
main = do
  putStrLn greeting
  printSecond

