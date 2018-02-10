# 11.4 バイナリ

# バイナリはバイトの列を表現する
# <<a, b, c.. >>
<<1, 2, 3>> |> IO.inspect

# ビット長を指定できる
<<1::size(2), 1::size(3)>> |> IO.inspect #=> '01001'なので9になる
b = <<1::size(2), 1::size(3)>>
IO.puts byte_size b #=> 1
IO.puts bit_size b  #=> 5

# IEEEの倍精度
# sign      : 符号 1ビット
# exp       : 指数 11ビット（実際の指数に1023を加えたもの）
# mantissa  : 仮数 52ビット（1.xxxのxxxの部分）
<< sign::size(1), exp::size(11), mantissa::size(52) >> = << 3.14159::float >>
IO.puts (1 + mantissa / :math.pow(2, 52)) * :math.pow(2, exp-1023)  #=> 3.14159
