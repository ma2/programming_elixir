# 10.4 内包表記

# ジェネレータ
# pattern <- enum
# コレクションからパターンにマッチする要素を順に取り出す
# ネストもできる
# x <- [1,2], y <- [5,6] #=> 「x=1, y=5」、「x=1, y=6」、「x=2,y=5」、「x=2, y=6」

# 内包表記1
# for ジェネレータ doブロック
IO.inspect for x <- [ 1, 2, 3, 4, 5 ], do: x * x
IO.inspect for x <- [1,2], y <- [5,6], do: x * y

# ジェネレータ由来の変数は、後のジェネレータで使うことができる
min_maxes = [{1,4}, {2,3}, {10, 15}]
IO.inspect for {min,max} <- min_maxes, n <- min..max, do: n

# 内包表記2
# for フィルタ doブロック
# 1から8の数を掛け合わせて、その結果が10で割り切れるペアのリストを作る
first8 = [ 1,2,3,4,5,6,7,8 ]
IO.inspect for x <- first8, y <- first8, x >= y, rem(x*y, 10)==0, do: { x, y }

# 内包表記はビットにも使える
# ジェネレータを << と >> で囲む
IO.inspect for << ch <- "hello" >>, do: ch

# 内包表記でリスト以外を返す
# into: パラメータは内包表記の結果を受け取る
IO.inspect for x <- ~w{ cat dog }, into: %{}, do: { x, String.upcase(x) }

# 練習問題：ListsAndRecursion - 7
# ListsAndRecursion - 4のspan関数と内包表記で1からnまでの素数のリストを作る
defmodule MyList do
    def span(from, to) when from == to, do: [from]
    def span(from, to) when from > to, do: span(to, from)
    def span(from, to), do: [from | span(from + 1, to)]
end

defmodule MyPrime do
    def prime(n) do
        for x <- MyList.span(2,n), prime?(x), do: x
    end
    defp prime?(2), do: true
    defp prime?(n) do
        # 2からn-1までのすべての数で、nが割り切れなかったら、nは素数である、 
        Enum.all?(MyList.span(2,n-1), &(rem(n, &1)!==0))
    end
end
IO.inspect MyPrime.prime(20)

# 練習問題：ListsAndRecursion - 8

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
[ id: 123, ship_to: :NC, net_amount: 100.00 ],
[ id: 124, ship_to: :OK, net_amount: 35.50 ],
[ id: 125, ship_to: :TX, net_amount: 24.00 ],
[ id: 126, ship_to: :TX, net_amount: 44.80 ],
[ id: 127, ship_to: :NC, net_amount: 25.00 ],
[ id: 128, ship_to: :MA, net_amount: 10.00 ],
[ id: 129, ship_to: :CA, net_amount: 102.00 ],
[ id: 130, ship_to: :NC, net_amount: 50.00 ] ]

defmodule Tax do
    def order_list(order, tax) do
        for o <- order, do: add_total(o, tax)
    end
    def add_total(o, tax) do
        [id: _id, ship_to: state, net_amount: value] = o
        tax = tax[state] || 0
        o ++ [total_amount: value * (1 + tax)]
    end
end

IO.inspect Tax.order_list(orders, tax_rates)