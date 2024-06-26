defmodule Otpex.Logs.Servers.Queue do
  use GenServer

  # Server
  def init(state), do: {:ok, state}

  def handle_call() do
  end

  def handle_call(:dequeue, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:queue, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:enqueue, value}, state) do
    {:noreply, state ++ [value]}
  end

  # Client
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def dequeue, do: GenServer.call(__MODULE__, :dequeue)
  def queue, do: GenServer.call(__MODULE__, :queue)
  def enqueue(value), do: GenServer.cast(__MODULE__, {:enqueue, value})
end
