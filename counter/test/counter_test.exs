defmodule CounterTest do
  use ExUnit.Case

  test "state/1" do
    counter = Counter.start_link(42)
    assert Counter.state(counter) == 42
  end

  test "increment/2" do
    counter = Counter.start_link(0)

    counter
    |> Counter.increment()

    assert Counter.state(counter) == 1

    counter
    |> Counter.increment()
    |> Counter.increment()

    assert Counter.state(counter) == 3
  end
end
