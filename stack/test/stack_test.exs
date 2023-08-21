defmodule StackTest do
  use ExUnit.Case

  import Stack

  setup do
    %{stack: start()}
  end

  test "state/1", %{stack: stack} do
    assert state(stack) == []
  end

  test "push/2", %{stack: stack} do
    stack
    |> push(:hi)
    |> push(:bye)

    assert state(stack) == [:bye, :hi]
  end

  test "pop/1", %{stack: stack} do
    stack
    |> push(:hi)
    |> push(:bye)

    assert pop(stack) == :bye
    assert state(stack) == [:hi]
  end
end
