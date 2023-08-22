defmodule Counter do
  def start_link(initial_value) do
    {:ok, pid} = GenServer.start_link(Counter.Server, initial_value)
    pid
  end

  def state(counter) do
    GenServer.call(counter, :state)
  end

  def increment(counter) do
    :ok = GenServer.cast(counter, :increment)
    counter
  end
end
