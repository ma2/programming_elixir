# 5.1 関数とパターンマッチ

# リストの連結
list_concat = fn(l1, l2) -> l1 ++ l2 end
IO.inspect list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]

# 三要素の和
sum = fn(a, b, c) -> a + b + c end
IO.puts sum.(1, 2, 3) #=> 6

# タプルをリストに変換
pair_tuple_to_list = fn(tp) -> {a, b} = tp; [a, b] end
IO.inspect pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]
