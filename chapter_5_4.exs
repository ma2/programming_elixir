# 5.4 関数を引数として渡す

t2 = fn(n) -> n * 2 end
apply = fn(func, val) -> func.(val) end
IO.puts apply.(t2, 10)  #=> 20

# map関数
Enum.map [1,2,3,4], t2 #=> [2,4,6,8]

# ピンで固定された値と関数パラメータ
defmodule Greeter do
    def for(name, greeting) do
        fn
            # 最初のパラメータとforに渡されたnameが同じときにマッチする
            (^name) -> "#{greeting} #{name}"
            (_)     -> "I don't know you"
        end
    end
end
# ここでnameがJoséにマッチして固定（^name）される
mr_valim = Greeter.for("José", "Oi!")
IO.puts mr_valim.("José") # => Oi! José
IO.puts mr_valim.("Taro") # => I don't know you

# &演算子
# 単体の&はfn ... endのショートカット
# &1、&2..が引数のプレースホルダ
time_2 = &(&1 * 2)
IO.puts time_2.(5)  #=> 10

# 名前付き関数をそのまま&で呼び出すと、無名関数でラップせずにそのままの関数が返る（最適化）
# このとき引数の順番はもとのままである必要がある
puts = &(IO.puts(&1))
puts.("Hello")    #=> Hello

# 引数の順番を変えているので最適化は行われず無名関数でラップされる
rnd = &(Float.round(&2, &1))

# {}や[]は演算子なので、以下のようにも書ける
divrem = &{ div(&1, &2), rem(&1, &2)}
IO.inspect divrem.(10, 3)  #=> {3,1}

# 練習問題：Functions - 5
# Enum.map [1,2,3,4], fn x -> x + 2 end
IO.inspect Enum.map [1,2,3,4], &(&1+2)

# Enum.each [1,2,3,4], fn x -> IO.inspect x end
Enum.each [1,2,3,4], &(IO.inspect &1)