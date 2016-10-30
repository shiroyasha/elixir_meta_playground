list = [1, 2, 3]

calculation1 = quote do
  list |> Enum.map(&(&1 * &1)) |> Enum.sum
end

IO.inspect calculation1

# =>
# {:|>, [context: Elixir, import: Kernel],
#   [{:|>, [context: Elixir, import: Kernel],
#        [{:list, [], Elixir},
#             {{:., [], [{:__aliases__, [alias: false], [:Enum]}, :map]}, [],
#                   [{:&, [],
#                            [{:*, [context: Elixir, import: Kernel],
#                                       [{:&, [], [1]}, {:&, [], [1]}]}]}]}]},
#                                  {{:., [], [{:__aliases__, [alias: false], [:Enum]}, :sum]}, [], []}]}

try do
  Code.eval_quoted(calculation1)
rescue
  _ -> IO.puts "Oooops this does not work"
end

calculation2 = quote do
  unquote(list) |> Enum.map(&(&1 * &1)) |> Enum.sum
end

IO.inspect calculation2

# =>
# {:|>, [context: Elixir, import: Kernel],
#   [{:|>, [context: Elixir, import: Kernel],
#        [[1, 2, 3],
#             {{:., [], [{:__aliases__, [alias: false], [:Enum]}, :map]}, [],
#                   [{:&, [],
#                            [{:*, [context: Elixir, import: Kernel],
#                                       [{:&, [], [1]}, {:&, [], [1]}]}]}]}]},
#                                  {{:., [], [{:__aliases__, [alias: false], [:Enum]}, :sum]}, [], []}]}

result = Code.eval_quoted(calculation2)

IO.inspect result # => 14
