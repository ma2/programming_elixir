# 4.4 コレクション型

# タプル
# 配列に似ている（順番がある）。複数値を返すときはタプルで返す
# 要素が5を超えたらマップか構造体を検討すること
{ 1, 2 }
{ :ok, 42, "next"}
{ :error, :enoent }

# タプルのパターンマッチ
{status, count, action} = {:ok, 42, "next"}
IO.puts status
IO.puts count
IO.puts action

# リスト型
# Lispのリストに似ている（carとcdrの構造）
[ 1, 2, 3 ]
1 in [1,2,3,4] #=> true

# キーワードリスト
# 「タプルのリスト」のショートカット。同じキーを何度でも使える
[ name: "Dave", city: "Dallas", likes: "Programming" ]
# =>
[ {:name, "Dave"}, {:city, "Dallas"}, {:likes, "Programming"} ]
# []でアクセスできる
a = [ name: "Dave", city: "Dallas", likes: "Programming", likes: "Ruby" ]
IO.puts a[:name]
# 実際にはKeywordモジュール、Enumモジュールの全関数が使える
IO.puts Keyword.get(a, :name)
IO.inspect Keyword.get_values(a, :likes)

# マップ
# いわゆるハッシュ。同じキーは1度だけ
# %{ key => value, key => value }
%{ "AL" => "Alabama", "WI" => "Wisconsin" }
%{ :red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff }
# キーがアトムのときはショートカットが使える
# ショートカット版
%{ red: 0xff0000, green: 0x00ff00, blue: 0x0000ff }

# マップのアクセス
# []でアクセスできる
states = %{ "AL" => "Alabama", "WI" => "Wisconsin" }
IO.puts states["AL"]
# キーがアトムのときはドット（.）でアクセスできる
colors = %{ red: 0xff0000, green: 0x00ff00, blue: 0x0000ff }
IO.puts colors.green
# Mapモジュールの関数が使える
IO.inspect Map.values colors

# バイナリ
<< 1, 2 >>
# ビット長を指定可能
<<3 :: size(2), 5 :: size(4), 1 :: size(2)>>