mod = quote do
  defmodule Test do
    def sum(a, b) do
      a + b
    end
  end
end

Code.eval_quoted(mod)

IO.inspect Test.sum(3, 4) # => 7
