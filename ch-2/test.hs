sayHello :: String -> IO()
sayHello x =
  putStrLn ("Hello," ++ x ++ "!")

triple :: Integer -> Integer
triple x = x * 3
