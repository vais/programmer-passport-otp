defmodule CalculatorTest do
  use ExUnit.Case

  import Calculator

  setup do
    %{calculator: start(0)}
  end

  test "negation", %{calculator: calculator} do
    calculator
    |> add(3)
    |> negate()
    |> add(1)

    assert equals(calculator) == -2
  end

  test "addition", %{calculator: calculator} do
    calculator |> add(10)
    assert equals(calculator) == 10
  end

  test "subtraction", %{calculator: calculator} do
    calculator |> subtract(10)
    assert equals(calculator) == -10
  end

  test "multiple operations in sequence", %{calculator: calculator} do
    calculator
    |> add(1)
    |> add(9)
    |> subtract(2)

    assert equals(calculator) == 8
  end

  test "clear", %{calculator: calculator} do
    calculator
    |> add(9)
    |> clear()

    assert equals(calculator) == 0
  end
end
