defmodule Calculator.Server do
  use GenServer

  alias Calculator.Core

  def init(state) do
    {:ok, state}
  end

  def handle_call(:negate, _from, state) do
    {:reply, :ok, Core.negate(state)}
  end

  def handle_call({:add, num}, _from, state) do
    {:reply, :ok, Core.add(state, num)}
  end

  def handle_call({:subtract, num}, _from, state) do
    {:reply, :ok, Core.subtract(state, num)}
  end

  def handle_call(:clear, _from, _state) do
    {:reply, :ok, 0}
  end

  def handle_call(:inc, _from, state) do
    {:reply, :ok, Core.inc(state)}
  end

  def handle_call(:equals, _from, state) do
    {:reply, state, state}
  end
end
