defmodule SuperDuper do
  @app __MODULE__.DynamicSupervisor

  def add_character(character, phrase) do
    DynamicSupervisor.start_child(@app, child_spec({character, phrase}))
  end

  def remove_character(character) do
    :ok = DynamicSupervisor.terminate_child(@app, GenServer.whereis(character))
  end

  def child_spec({character, _phrase} = info) do
    %{id: character, start: {__MODULE__, :start_link, [info]}}
  end

  def child_spec(character) do
    %{id: character, start: {__MODULE__, :start_link, [character]}}
  end

  def start_link({character, _phrase} = info) do
    GenServer.start_link(SuperDuper.Server, info, name: character)
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
