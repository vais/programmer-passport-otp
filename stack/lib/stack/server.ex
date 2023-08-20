defmodule Stack.Server do
  use GenServer

  def init(state) do
    {:ok, state}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:push, term}, state) do
    {:noreply, Stack.Core.push(state, term)}
  end
end
