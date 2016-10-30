defmodule Verbose do
  defmacro defv(head, body) do
    {fun_name, args_ast} = Macro.decompose_call(head)

    quote do
      def unquote(head) do
        IO.puts "Executing: #{unquote(fun_name)}"

        result = unquote(body[:do])

        IO.puts "Result: #{inspect result}"

        result
      end
    end
  end
end

defmodule Test do
  import Verbose

  defv sum(a, b) do
    a + b
  end

  defv product(a, b) do
    a * b
  end
end

Test.sum(1, 3)

# Executing: sum
# Result: 4

Test.product(1, 4)

# Executing: product
# Result: 4
