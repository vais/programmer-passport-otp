defmodule Stack.Core do
  def push(stack, term) do
    [term | stack]
  end

  def pop([term | stack] = _stack) do
    {term, stack}
  end
end
