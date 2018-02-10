# 11.3 ングルクオートで囲まれた文字列―――文字コードのリスト

# Elixirは印字可能な整数のみのリストがあると、文字列として印字する
IO.inspect [67, 65, 84] #=> 'CAT'

# 印字可能ではないコートが交じるとリスト表記になる
IO.inspect [67, 65, 84] ++ [0]  #=> [67, 65, 84, 0]

# 練習問題：StringsAndBinaries - 1
# シングルクオート文字列が、印字可能なASCII 文字（スペースからチルダまで）だけを含む場合に
# true を返す関数
defmodule Single do
    def printable([]), do: true
    def printable([head|tail]) when head >= ?\s and head <= ?~, do: printable(tail)
    def printable(_), do: false
end

IO.puts '* StringsAndBinaries - 1'
IO.inspect Single.printable('test')
IO.inspect Single.printable('test' ++ [0])

# 練習問題：StringsAndBinaries - 2
# パラメータがアナグラムだったらtrue を返す関数
defmodule Single do
    def anagram?(word1, word2), do: sort(word1) == sort(word2)
    defp sort([]), do: []
    defp sort([h|[]]), do: [h]
    defp sort([h1|[h2|tail]]) when h1 <= h2, do: [h1,h2] ++ sort(tail)
    defp sort([h1|[h2|tail]]), do: [h2,h1] ++ sort(tail)
end

IO.puts '* StringsAndBinaries - 2'
IO.inspect Single.anagram?('', '')  #=> true
IO.inspect Single.anagram?('test', 'test')  #=> true
IO.inspect Single.anagram?('test', 'etts')  #=> true
IO.inspect Single.anagram?('test', 'ettss')  #=> false

# 練習問題：StringsAndBinaries - 4
# 「数字[+-*/] 数字」という形のシングルクオート文字列を受け、その計算結果を返す関数
defmodule Single do
    def calcurate(list), do: calc(list, 0)
    defp calc([], value), do: value
    defp calc([h|t], value) when h == ?\s, do: calc(t, value)
    defp calc([h|t], value) when h in '0123456789' do
        calc(t, value*10 + h - ?0)
    end
    defp calc([?-|t], value), do: value - calc(t, 0)
    defp calc([?+|t], value), do: value + calc(t, 0)
    defp calc([?*|t], value), do: value * calc(t, 0)
    defp calc([?/|t], value), do: value / calc(t, 0)
end

IO.puts Single.calcurate('10 + 20')
IO.puts Single.calcurate('10 - 20')
IO.puts Single.calcurate('10 * 20')
IO.puts Single.calcurate('10 / 20')
