defmodule Calculator do
  def start(state) do
    {:ok, pid} = Calculator.Server.start_link(state)
    pid
  end

  def negate(calculator) do
    :ok = GenServer.cast(calculator, :negate)
    calculator
  end

  def add(calculator, number) do
    :ok = GenServer.cast(calculator, {:add, number})
    calculator
  end

  def subtract(calculator, number) do
    :ok = GenServer.cast(calculator, {:subtract, number})
    calculator
  end

  def clear(calculator) do
    :ok = GenServer.cast(calculator, :clear)
    calculator
  end

  def inc(calculator) do
    send(calculator, :inc)
    calculator
  end

  def equals(calculator) do
    GenServer.call(calculator, :equals)
  end
end
