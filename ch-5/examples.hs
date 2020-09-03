module Examples where
-- fst :: (a, b) -> a
-- length :: [a] -> Int

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

subtractStuff :: Integer -> Integer -> Integer
subtractStuff x y = x - y - 10

subtractOne :: Integer -> Integer
subtractOne = subtractStuff 1


func1 :: a -> a -> a
func1 a b = a

func2 :: a -> a -> a
func2 a b = b

func3 :: a -> b -> b
func3 x y = y 

-- declare types locally with let and where
triple x = tripleItYo x
  where tripleItYo :: Integer -> Integer
        tripleItYo y = y * 3