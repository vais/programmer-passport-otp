defmodule Calculator.Boundary do
  alias Calculator.Core

  def start(state) do
    spawn(fn -> run(state) end)
  end

  def run(state) do
    state
    |> listen
    |> run
  end

  def listen(state) do
    receive do
      {:add, number} ->
        Core.add(state, number)

      {:subtract, number} ->
        Core.subtract(state, number)

      {:equals, client_pid} ->
        send(client_pid, {:result, state})
        state

      {:clear} ->
        0
    end
  end
end
