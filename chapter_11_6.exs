# 11.6 バイナリとパターンマッチ

# 練習問題：StringsAndBinaries - 6
# 文字列にある文をキャピタライズする関数
# それぞれの文はピリオドと1文字のスペースで終わる
# 文字列は大文字小文字がランダムに交じっている
# MyString.Capitalize("oh. a DOG. wooF. ") #=> "Oh. A dog. Woof. "

defmodule MyString do
    def capitalize(str) do
        str
        |> String.split(~r(\.\s+))
        |> Enum.map(&String.capitalize(&1))
        |> Enum.join(". ")
    end
end

IO.puts MyString.capitalize("oh. a DOG. wooF. ")

# 練習問題：StringsAndBinaries - 7
# ファイルsales.txtから読んだデータをListsAndRecursion - 8で作った関数に渡せる形式に変換する

defmodule Tax do
    def from_file(filename) do
        File.stream!(filename)
        |> Stream.drop(1)               # ヘッダ行のスキップ
        |> Stream.map(&String.trim/1)   # 改行を除去
        |> Stream.map(&String.split(&1, ","))   # カンマ区切りで分解
        |> Stream.map(&make_line(&1))
    end
    def make_line([<<id::binary>>, <<?:, ship_to::binary>>, <<amount_str::binary>>]) do
        {net_amount, _} = Float.parse(amount_str)
        [id: id, ship_to: String.to_atom(ship_to), net_amount: net_amount]
    end
    def order_list(order, tax) do
        for o <- order, do: add_total(o, tax)
    end
    def add_total(o, tax) do
        [id: _id, ship_to: state, net_amount: value] = o
        tax = tax[state] || 0
        o ++ [total_amount: value * (1 + tax)]
    end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]
IO.inspect Tax.order_list Tax.from_file("G:/scripts/elixir/intro/sales.txt"), tax_rates
