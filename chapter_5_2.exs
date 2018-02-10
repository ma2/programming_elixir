# 5.2 一つの関数、複数のボディ

handle_open = fn
    {:ok, file} -> "First Line: #{IO.read(file, :line)}"
    {_, error} -> "Error: #{:file.format_error(error)}"
end

# 存在するファイルを開く
IO.puts handle_open.(File.open("hello.exs"))
# そして、存在しないファイルを開こうとする
IO.puts handle_open.(File.open("nonexistent"))

# 練習問題：Functions - 2
# もし最初の二つの引数が0 なら“FizzBuzz”を返す
# もし最初の引数が0 なら“Fizz” を返す
# もし二番目の引数が0なら“Buzz” を返す
# そうでなければ三番目の引数を返す。
fb = fn
    {0, 0, _} -> "FizzBuzz"
    {0, _, _} -> "Fizz"
    {_, 0, _} -> "Buzz"
    {_, _, a} -> a
end

IO.puts fb.({0,0,0})
IO.puts fb.({0,0,1})
IO.puts fb.({0,1,0})
IO.puts fb.({0,1,1})
IO.puts fb.({1,0,0})
IO.puts fb.({1,0,1})
IO.puts fb.({1,1,0})
IO.puts fb.({1,1,1})

# 練習問題：Functions - 3
fizzbuzz = fn(n) -> fb.({rem(n, 3), rem(n, 5), n}) end

IO.puts "real FizzBuzz start"
IO.puts fizzbuzz.(10)
IO.puts fizzbuzz.(11)
IO.puts fizzbuzz.(12)
IO.puts fizzbuzz.(13)
IO.puts fizzbuzz.(14)
IO.puts fizzbuzz.(15)
IO.puts fizzbuzz.(16)