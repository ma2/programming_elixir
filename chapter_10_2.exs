# 10.2 ストリーム―――遅延列挙

# Enum.mapではなくStream.mapを使うと、リストではなくストリームが返る
# with_indexは値とインデクスのタプルを返すことに注意
[ 1, 2, 3, 4, 5 ]
|> Enum.map(&(&1*&1))
|> Enum.with_index
|> Enum.map(fn {value, index} -> value - index end)
|> IO.inspect #=> [1,3,7,13,21]

[1,2,3,4]
|> Stream.map(&(&1*&1))
|> Stream.map(&(&1+1))
|> Stream.filter(fn x -> rem(x,2) == 1 end)
|> Enum.to_list
|> IO.inspect #=> [5, 17]

# 通常のリストは全部揃うまで待つ必要がある
Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5) |> IO.inspect

# ストリームは待たない
# 要素5つで処理が終わり残りは読まない
Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5) |> IO.inspect

# Stream.cycle(enum)
# 列挙可能なデータを順に返し、最後まで行ったら最初から繰り返し（無限に）返す

# Stream.repeatedly(func)
# 関数を引数にとり、必要とされるだけ関数を呼び出して値を返す
# Enum.take(list, 5)
# ↑のlistにStream.repeatedlyを使うと
Stream.repeatedly(fn -> true end) |> Enum.take(5) |> IO.inspect
Stream.repeatedly(&:random.uniform/0) |> Enum.take(5) |> IO.inspect

# Stream.iterate(start_value, next_fun)
# 初期値start_value、それにnext_funを次々と適用した結果をストリームで返す
Stream.iterate(0, &(&1+1)) |> Enum.take(5) |> IO.inspect

# Stream.unfold(tuple, func)
# タプルが関数に渡され、関数は「値」と「次の関数の引数」のタプルを返す
# これを「値」がnilになるまで繰り返す
# タプルは2要素じゃないといけないはず
Stream.unfold({0,1}, fn {f1,f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15) |> IO.inspect

# Stream.resource(func1, func2, func3)
# ストリームがアクティブになったらfunc1を実行
# ストリームが終了したらfunc3を実行
# func2はunfoldと同じように使われる。初期値はfunc1の結果