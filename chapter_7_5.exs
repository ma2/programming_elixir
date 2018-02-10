# 7.5 再帰中の値の保持

# リストの合計値を求める関数で途中経過を保持する変数totalが必要になる
defmodule MyList do
    def sum([], total), do: total
    def sum([ head | tail ], total), do: sum(tail, head+total)
end

# ただtotalの初期を与えないといけないのが美しくない
IO.puts MyList.sum([1,2,3,4,5], 0)  #=> 15

# そこでtotalを隠すのがElixir流
# defpはプライベート関数（モジュール内でしか使えない）を定義する
# _sumの先頭のアンダースコアは単なる慣習
defmodule MyList do
    def sum(list), do: _sum(list, 0)
    defp _sum([], total), do: total
    defp _sum([ head | tail ], total), do: _sum(tail, head+total)
end

IO.puts MyList.sum([1,2,3,4,5])  #=> 15

# 練習問題：ListsAndRecursion - 0
# 途中経過変数を使わずにsumを書く
defmodule MyList do
    def sum([]), do: 0
    def sum([head|tail]), do: head + sum(tail)
end

IO.puts MyList.sum([1,2,3,4,5])  #=> 15

# 練習問題：ListsAndRecursion - 1
# リストの要素にfuncを適用した値の総和を返すmapsum
defmodule MyList do
    def mapsum([], _func), do: 0
    def mapsum([head|tail], func), do: func.(head) + mapsum(tail, func)
end

IO.puts MyList.mapsum([1,2,3,4,5], &(&1*2)) #=> 30

# 練習問題：ListsAndRecursion - 2
# リストの最大値を返すmax
defmodule MyList do
    def max([a]), do: a
    def max([a, b]) when a <= b, do: b
    def max([a, b]) when a > b, do: a
    def max([head|tail]), do: max(head, max(tail))
end

IO.puts MyList.max([1])     #=> 1
IO.puts MyList.max([1,2])   #=> 2
IO.puts MyList.max([2,1])   #=> 2
IO.puts MyList.max([10, 21, 4, -1, 70, 0])  #=> 70
IO.puts MyList.max('this is a pen') #=> 116(t)

# 練習問題：ListsAndRecursion - 3
defmodule MyList do
    defp cycle(c, n) when c+n <= 122, do: c + n
    defp cycle(c, n), do: c + n - 26
    def caesar([a], n), do: [cycle(a, n)]
    def caesar([head|tail], n), do: [cycle(head, n)|caesar(tail,n)]
end

IO.puts MyList.caesar('test', 1)    #=> uftu
IO.puts MyList.caesar('test', 10)    #=> docd
