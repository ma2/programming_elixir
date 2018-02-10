# 10.1 Enum―――コレクションの処理

# 練習問題：ListsAndRecursion - 5

defmodule MyEnum do
    def all?([], _func), do: false
    def all?([a], func), do: func.(a)
    def all?([head|tail], func), do: func.(head) && all?(tail, func)
end

IO.puts MyEnum.all?([], &(&1 == 1))
IO.puts MyEnum.all?([1], &(&1 == 1))
IO.puts MyEnum.all?([2], &(&1 == 1))
IO.puts MyEnum.all?([1,1,1], &(&1 == 1))
IO.puts MyEnum.all?([1,1,2], &(&1 == 1))

defmodule MyEnum do
    def each([], _func), do: nil
    def each([a], func), do: func.(a)
    def each([head|tail], func) do
        func.(head)
        each(tail, func)
    end
end

MyEnum.each([], &(IO.puts(&1 * 2)))
MyEnum.each([1], &(IO.puts(&1 * 2)))
MyEnum.each([1,2], &(IO.puts(&1 * 2)))

defmodule MyEnum do
    def filter([], _func), do: []
    def filter([a], func) do
        if func.(a), do: [a], else: []
    end
    def filter([head|tail], func), do: filter([head], func) ++ filter(tail, func)
end

IO.inspect MyEnum.filter([], &(&1 > 3))
IO.inspect MyEnum.filter([1], &(&1 > 3))
IO.inspect MyEnum.filter([4], &(&1 > 3))
IO.inspect MyEnum.filter([1,2,3], &(&1 > 3))
IO.inspect MyEnum.filter([4,5,6], &(&1 > 3))
IO.inspect MyEnum.filter([3,4,5,4,3], &(&1 > 3))

# split(list, count)
# listをcount個のリストとそれ以外のリストの配列にして返す
defmodule MyEnum do
    def split([head|tail], c) when c > 0 do
        [first, rest] = split(tail, c - 1)
        [[head|first], rest]
    end
    def split(list, _c), do: [[], list]
end

IO.inspect MyEnum.split([], 0)
IO.inspect MyEnum.split([], 1)
IO.inspect MyEnum.split([1], 0)
IO.inspect MyEnum.split([1,2], 1)
IO.inspect MyEnum.split([1,2,3,4], 0)
IO.inspect MyEnum.split([1,2,3,4], 2)
IO.inspect MyEnum.split([1,2,3,4], 5)

# take(list, count)
# listの最初のcount個を取り出す
defmodule MyEnum do
    def take([head|tail], c) when c > 0 do
        rest = take(tail, c - 1)
        [head|rest]
    end
    def take(_list, _c), do: []
end

IO.inspect MyEnum.take([], 0)
IO.inspect MyEnum.take([], 1)
IO.inspect MyEnum.take([1], 0)
IO.inspect MyEnum.take([1], 1)
IO.inspect MyEnum.take([1,2,3,4], 0)
IO.inspect MyEnum.take([1,2,3,4], 2)
IO.inspect MyEnum.take([1,2,3,4], 5)

# 練習問題：ListsAndRecursion - 6

# 毎回リストを作り直すので効率が悪い実装
defmodule MyEnum do
    def flatten([]), do: []
    def flatten([head|tail]), do: flatten(head) ++ flatten(tail)
    # [head|tail]にマッチしないということはリストじゃない
    def flatten(atom), do: [atom]
end

IO.inspect MyEnum.flatten([])
IO.inspect MyEnum.flatten([1])
IO.inspect MyEnum.flatten([1,2])
IO.inspect MyEnum.flatten([1,[2]])
IO.inspect MyEnum.flatten([1,[2, 3, [4, [5]]]])
