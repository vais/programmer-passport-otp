defmodule Calculator.CoreTest do
  use ExUnit.Case, async: true

  import Calculator.Core

  test "negation", do: assert(negate(3) == -3)
  test "addition", do: assert(add(1, 2) == 3)
  test "subtraction", do: assert(subtract(1, 2) == -1)
  test "multiplicaton", do: assert(multiply(1, 2) == 2)
  test "division", do: assert(divide(1, 2) == 0.5)
  test "incrementing", do: assert(inc(1) == 2)
  test "decrementing", do: assert(dec(1) == 0)
  test "folding", do: assert(fold([1, 2, 3], 0, &subtract/2) == -6)
end
