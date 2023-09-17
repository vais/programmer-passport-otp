defmodule SuperDuper.Core do
  def info(character) do
    {character, say(character)}
  end

  defp say(:supermario) do
    "Hoo hoo! Just what I needed!"
  end

  defp say(:superdave) do
    "Next time you shoot a bullet at a metal object, watch the ricochet."
  end

  defp say(:superman) do
    "It doesn't take X-Ray Vision to see you are up to no good."
  end
end
