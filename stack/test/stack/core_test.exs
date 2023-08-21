defmodule Stack.CoreTest do
  use ExUnit.Case, async: true

  import Stack.Core

  test "push/2" do
    stack =
      []
      |> push(1)
      |> push(2)
      |> push(3)

    assert stack == [3, 2, 1]
  end

  test "pop/1" do
    {term, stack} = pop([3, 2, 1])
    assert term == 3
    assert stack == [2, 1]
  end
end
