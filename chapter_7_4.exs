# 7.4 map 関数の作成

# [head|tail]で、リストのcarとcdrにアクセスできる
# 使わない変数は_を頭につけるとElixirが警告しなくなる
defmodule MyList do
    def map([], _func), do: []
    def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]
end

IO.inspect MyList.map([1,2,3,4], fn(n) -> n*3 end)  #=> [3,6,9,12]