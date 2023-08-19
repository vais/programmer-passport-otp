defmodule Calculator.Core do
  def add(acc, num), do: acc + num
  def subtract(acc, num), do: acc - num
  def multiply(acc, num), do: acc * num
  def divide(acc, num), do: acc / num
  def inc(acc), do: acc + 1
  def dec(acc), do: acc - 1

  def fold(list, acc, f) do
    Enum.reduce(list, acc, fn item, acc -> f.(acc, item) end)
  end
end
