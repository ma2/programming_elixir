# 6.5 デフォルトパラメータ

# パラメータ \\ 値 で、パラメータのデフォルトを設定できる
# デフォルトのない必須パラメータは優先的にマッチする
# デフォルト値付きパラメータは左からマッチして、不足分はデフォルトにマッチする
defmodule Example do
    def func(p1, p2 \\ 2, p3 \\ 3, p4) do
        IO.inspect [p1, p2, p3, p4]
    end
end

Example.func("a", "b")              # => ["a",2,3,"b"]
Example.func("a", "b", "c")         # => ["a","b",3,"c"]
Example.func("a", "b", "c", "d")    # => ["a","b","c","d"]

# 練習問題：ModulesAndFunctions - 6
defmodule Chop do
    def new_guess(range) do
        min..max = range
        div(min + max, 2)
    end
    def guess(actual, range, current_guess \\ 500)
    def guess(actual, _, current_guess) when actual == current_guess do
        IO.puts actual
    end
    def guess(actual, range, current_guess) when actual < current_guess do
        IO.puts "Is it #{current_guess}"
        min.._ = range
        new_range = min..(current_guess-1)
        guess(actual, new_range, new_guess(new_range))
    end
    def guess(actual, range, current_guess) when actual > current_guess do
        IO.puts "Is it #{current_guess}"
        _..max = range
        new_range = (current_guess+1..max)
        guess(actual, new_range, new_guess(new_range))
    end
end

Chop.guess(592, 1..1000)