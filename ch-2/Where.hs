module Where where

val1 = x
    where x = 5

val2 = x * x
    where x = 5

val3 = x * y
    where x = 5
          y = 6

val4 = x + 3
    where x = 3
          y = 1000

val5 = x * 3 + y
    where x = 3
          y = 1000

val6 = x * 5
    where y = 10
          x = 10 * 5 + y

val7 = z / x + y
    where x = 7
          y = negate x
          z = y * 10

waxOn = x * 5
    where z = 7
          y = z + 8
          x = y ^ 2

triple x = x * 3

waxOff x = triple x
