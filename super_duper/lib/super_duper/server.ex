defmodule SuperDuper.Server do
  use GenServer

  def init({_character, _phrase} = info) do
    {:ok, info}
  end

  def init(character) do
    {:ok, SuperDuper.Core.info(character)}
  end

  def handle_call(:say, _from, {_character, phrase} = state) do
    {:reply, phrase, state}
  end

  def handle_cast(:die, state) do
    raise("so long cruel world...")
    {:noreply, state}
  end
end
