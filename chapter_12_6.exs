# 12.6 少ない努力で、大きな成果

# 練習問題：ControlFlow - 1
# FizzBuzzの例をcaseを使って書き換える

# 元の例（パターンマッチ版）
defmodule PatternFizzBuzz do
    def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)
    defp fizzbuzz(n), do: _fizzword(n, rem(n, 3), rem(n, 5))
    defp _fizzword(_n, 0, 0), do: "FizzBuzz"
    defp _fizzword(_n, 0, _), do: "Fizz"
    defp _fizzword(_n, _, 0), do: "Buzz"
    defp _fizzword( n, _, _), do: n
end

# 元の例（cond版）
defmodule CondFizzBuzz do
    def upto(n) when n > 0 do
        1..n |> Enum.map(&fizzbuzz/1)
    end
    defp fizzbuzz(n) do
        cond do
            rem(n, 3) == 0 and rem(n, 5) == 0 ->
                "FizzBuzz"
            rem(n, 3) == 0 ->
                "Fizz"
            rem(n, 5) == 0 ->
                "Buzz"
            true ->
                n
        end
    end
end

# caseバージョン
defmodule CaseFizzBuzz do
    def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)
    defp fizzbuzz(n), do: _fizzword({n, rem(n, 3), rem(n, 5)})
    defp _fizzword(params) do
        case params do
            {_, 0, 0} -> "FizzBuzz"
            {_, 0, _} -> "Fizz"
            {_, _, 0} -> "Buzz"
            {n, _, _} -> n
        end
    end
end

IO.inspect CaseFizzBuzz.upto(20)

# 練習問題：ControlFlow - 3
# 任意の引数をとるok!という関数を書く
# パラメータが{:ok, data}というタプルであれば、data を返す
# そうでなければ、パラメータの情報を含む例外を発生する

defmodule Error do
    def ok!({:ok, data}), do: data
    def ok!(param), do: raise param
end

# file = Error.ok! File.open("somefile")
IO.inspect Error.ok! File.open("G:/scripts/elixir/intro/sales.txt")