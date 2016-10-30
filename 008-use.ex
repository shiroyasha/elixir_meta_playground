defmodule Ticker do
  defmacro __using__([timeout: timeout]) do
    quote do
      use GenServer

      def start_link do
        GenServer.start_link(__MODULE__, [])
      end

      def init(_) do
        send(self, :tick)

        {:ok, :ok}
      end

      def handle_info(:tick, :ok) do
        on_tick

        :timer.send_after(unquote(timeout), :tick)

        {:noreply, :ok}
      end

      def on_tick, do: nil # nothing

      defoverridable [on_tick: 0]
    end
  end
end

defmodule Test do
  use Ticker, timeout: 500

  def on_tick do
    IO.puts "I was ticked"
  end
end

Test.start_link
:timer.sleep(:infinity)
