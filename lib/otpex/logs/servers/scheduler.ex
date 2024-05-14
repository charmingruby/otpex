defmodule Otpex.Logs.Servers.Scheduler do
  use GenServer

  # Server
  def init(state) do
    schedule_event()

    {:ok, state}
  end

  def handle_info(msg, state) do
    IO.inspect("Received the message: #{msg}")

    schedule_event()

    {:noreply, state}
  end

  defp schedule_event() do
    Process.send_after(self(), "hello", :timer.seconds(2))
  end

  # Client
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
end
