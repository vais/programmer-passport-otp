defmodule Calculator do
  def start(state) do
    Calculator.Boundary.start(state)
  end

  def add(calculator, number) do
    send(calculator, {:add, number})
    calculator
  end

  def subtract(calculator, number) do
    send(calculator, {:subtract, number})
    calculator
  end

  def equals(calculator) do
    send(calculator, {:equals, self()})

    receive do
      {:result, result} -> result
    after
      5000 -> {:error, :timeout}
    end
  end

  def clear(calculator) do
    send(calculator, {:clear})
    calculator
  end
end
