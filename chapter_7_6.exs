# 練習問題：ListsAndRecursion - 4
# from からto までの数のリストを返す関数MyList.span(from, to)
defmodule MyList do
    def span(from, to) when from == to, do: [from]
    def span(from, to) when from > to, do: span(to, from)
    def span(from, to), do: [from | span(from + 1, to)]
end

IO.inspect MyList.span(1, 1)
IO.inspect MyList.span(1, 2)
IO.inspect MyList.span(2, 1)
IO.inspect MyList.span(1, 10)