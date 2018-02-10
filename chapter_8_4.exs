# 8.4 マップのパターンマッチ

person = %{ name: "Dave", height: 1.88 }

# personに:name をキーとするエントリがあるか？
%{ name: a_name } = person
IO.puts a_name

# :name と:height をキーとするエントリがあるか？
%{ name: _, height: _ } = person

# :name というキーのエントリの値は"Dave" か？
%{ name: "Dave" } = person