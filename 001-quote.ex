IO.inspect quote do: 1 + 1
# => {:+, [context: Elixir, import: Kernel], [1, 1]}

IO.inspect quote do: %{a: 1, b: 5}
# => {:%{}, [], [a: 1, b: 5]}

function = quote do
  def test(a, b) do
    a + b
  end
end

IO.inspect function
# =>
# {:def, [context: Elixir, import: Kernel],
#   [{:test, [context: Elixir], [{:a, [], Elixir}, {:b, [], Elixir}]},
#      [do: {:+, [context: Elixir, import: Kernel],
#            [{:a, [], Elixir}, {:b, [], Elixir}]}]]}


mod = quote do
  defmodule Test do
    def sum(a, b) do
      a + b
    end
  end
end

IO.inspect mod

# =>
# {:defmodule, [context: Elixir, import: Kernel],
#   [{:__aliases__, [alias: false], [:Test]},
#      [do: {:def, [context: Elixir, import: Kernel],
#            [{:sum, [context: Elixir], [{:a, [], Elixir}, {:b, [], Elixir}]},
#                  [do: {:+, [context: Elixir, import: Kernel],
#                           [{:a, [], Elixir}, {:b, [], Elixir}]}]]}]]}
