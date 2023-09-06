defmodule Calculator do
  def start(state) do
    {:ok, pid} = GenServer.start_link(Calculator.Server, state)
    pid
  end

  def negate(calculator) do
    :ok = GenServer.call(calculator, :negate)
    calculator
  end

  def add(calculator, number) do
    :ok = GenServer.call(calculator, {:add, number})
    calculator
  end

  def subtract(calculator, number) do
    :ok = GenServer.call(calculator, {:subtract, number})
    calculator
  end

  def clear(calculator) do
    :ok = GenServer.call(calculator, :clear)
    calculator
  end

  def inc(calculator) do
    :ok = GenServer.call(calculator, :inc)
    calculator
  end

  def equals(calculator) do
    GenServer.call(calculator, :equals)
  end
end
