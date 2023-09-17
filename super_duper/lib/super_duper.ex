defmodule SuperDuper do
  def child_spec(character) do
    %{id: character, start: {__MODULE__, :start_link, [character]}}
  end

  def start_link(character) do
    GenServer.start_link(SuperDuper.Server, character, name: character)
  end

  def say(character) do
    GenServer.call(character, :say)
  end

  def kill(character) do
    GenServer.cast(character, :die)
  end
end
