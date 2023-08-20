defmodule Stack.Core do
  def push(stack, term) do
    [term | stack]
  end
end
