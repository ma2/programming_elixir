# 8.6 構造体
# 構造体はモジュールでラップされたマップ
# ただのマップと異なり初期値を前提できる
# モジュールなので、関数も追加できる

defmodule Subscriber do
    defstruct name: "", paid: false, over_18: true
end

# 別モジュールにしないとSubscriberにアクセスできない
defmodule MyApp do
    import Subscriber
    s1 = %Subscriber{}
    s2 = %Subscriber{ name: "Dave" }

    IO.inspect s1
    IO.inspect s2
end
