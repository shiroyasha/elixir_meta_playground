defmodule MyMacros do
  defmacro unless(expresion, do: block) do
    quote do
      if !unquote(expresion) do
        unquote(block)
      end
    end
  end
end

defmodule Test do
  require MyMacros

  def test1 do
    MyMacros.unless 1 > 2 do
      IO.puts "1 is not greater than 2"
    end
  end

  def test2 do
    MyMacros.unless 3 > 2 do
      IO.puts "3 is not greater than 2"
    end
  end
end

Test.test1 # => "1 is not greater than 2"
Test.test2 # => ""
