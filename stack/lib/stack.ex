defmodule Stack do
  def start() do
    {:ok, stack} = GenServer.start(Stack.Server, [])
    stack
  end

  def state(stack) do
    GenServer.call(stack, :state)
  end

  def push(stack, term) do
    :ok = GenServer.cast(stack, {:push, term})
    stack
  end
end
