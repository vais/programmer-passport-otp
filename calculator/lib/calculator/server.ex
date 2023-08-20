defmodule Calculator.Server do
  use GenServer

  alias Calculator.Core

  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast(:negate, state) do
    {:noreply, Core.negate(state)}
  end

  def handle_cast({:add, num}, state) do
    {:noreply, Core.add(state, num)}
  end

  def handle_cast({:subtract, num}, state) do
    {:noreply, Core.subtract(state, num)}
  end

  def handle_cast(:clear, _state) do
    {:noreply, 0}
  end

  def handle_call(:equals, _from, state) do
    {:reply, state, state}
  end
end
