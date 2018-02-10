# 4.7 変数スコープ

# withはローカル変数のスコープを作る
a = 100
with a = 1
do
    IO.puts a   #=> 1
end
IO.puts a   #=> 100

# withのパターンマッチに<-を使うと、マッチに失敗したとき例外ではなく失敗した値を返す
IO.puts with [a|_] <- [1,2,3], do: a    #=> 1
IO.puts with [a|_] <- 100, do: a        #=> 100
