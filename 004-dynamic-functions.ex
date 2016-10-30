defmodule Color do
  @colors %{
    red: 31,
    green: 32,
    blue: 33
  }

  @colors |> Enum.each(fn({color, ansi_code}) ->
    def unquote(color)(value) do
      "\e[#{unquote(ansi_code)}m#{value}\e[0m"
    end
  end)
end

IO.puts "The result of #{Color.red(1)} + #{Color.red(2)} is #{Color.green(3)}"

# => The result of 1 + 2 is 3
