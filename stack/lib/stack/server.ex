defmodule Stack.Server do
  use GenServer

  alias Stack.Core

  def init(state) do
    {:ok, state}
  end

  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:pop, _from, state) do
    {term, new_state} = Core.pop(state)
    {:reply, term, new_state}
  end

  def handle_cast({:push, term}, state) do
    {:noreply, Core.push(state, term)}
  end
end
