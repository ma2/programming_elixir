# 6.3 関数呼び出しとパターンマッチ

# do: ... は、do ... end の真の姿
# 実は単なるトーワードリストであった
defmodule Factorial do
    def of(0), do: 1
    def of(n), do: n * of(n-1)
end

IO.puts Factorial.of(3)
IO.puts Factorial.of(7)
IO.puts Factorial.of(20)

# 練習問題：ModulesAndFunctions - 4
defmodule Sum do
    def of(1), do: 1
    def of(n), do: n + of(n-1)
end

IO.puts Sum.of(1)
IO.puts Sum.of(10)
IO.puts Sum.of(100)

# 練習問題：ModulesAndFunctions - 5
# 二つの負ではない整数の最大公約数を求める関数gcd(x, y)

defmodule Gcd do
    def of(x, 0), do: x
    def of(x, y), do: of(y, rem(x, y))
end

IO.puts Gcd.of(1,1)     #=> 1
IO.puts Gcd.of(15,10)   #=> 5
IO.puts Gcd.of(128,96)  #=> 32
