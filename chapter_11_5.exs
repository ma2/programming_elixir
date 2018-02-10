# 11.5 ダブルクオート文字列はバイナリ

# シングルクォートでくくった文字列は「文字のリスト」
# ダブルクォートでくくった文字列は「UTF-8文字のバイト列」
dqs = "δx/δy"
IO.puts String.length dqs
IO.puts byte_size dqs
IO.puts String.at(dqs, 0)
IO.inspect String.codepoints(dqs)
IO.inspect String.split(dqs, "/")

# codepointsはUTF-8の単位に分解する。結合文字は分解される
IO.inspect String.codepoints("noie\u03081") #=> ["n", "o", "i", "e", "̈", "1"]
# graphemesは文字に分解する。結合文字は一文字として扱われる
IO.inspect String.graphemes("noie\u03081")  #=> ["n", "o", "i", "ë", "1"]

# 練習問題：StringsAndBinaries - 5
# ダブルクオート文字列のリストを取り、それぞれ別々の行で出力する関数
# 各行の文字列は、最も長い文字列の幅にセンタリングして出力する
defmodule MyList do
    def center(strings) do
        max = strings |> Enum.map(&String.length/1) |> Enum.max
        strings |> Enum.each(&(IO.puts cjust(&1, max)))
    end
    defp cjust(str, new_length) do
        l = div(new_length - String.length(str), 2)
        "#{String.duplicate(" ", l)}#{str}"
    end
end

MyList.center(["it", "was", "said", "this", "is", "the", "elephant"])
# 幅が倍の文字についてはうまくいかない
MyList.center(["どうやら", "これが", "正解", "らしきもの", "と", "言えるだろう", "ね"])
