# 5.3 関数は関数を返すことができる

# prefixは文字列を一つ取り、文字列を取る関数を返す
# 二番目の関数が呼ばれたときには、一番目の文字列、スペース、二番目の文字列をもった文字列を返す
prefix = fn(pre) -> fn(other) -> "#{pre} #{other}" end end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")