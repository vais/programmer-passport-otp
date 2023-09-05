defmodule EggTimer.Alarm do
  defstruct [:name, :duration, :callback, :created_at]

  alias EggTimer.Clock

  def new(name, duration, callback \\ &default_callback/1)
      when is_atom(name) and is_integer(duration) and is_function(callback),
      do: %__MODULE__{
        name: name,
        duration: duration,
        callback: callback,
        created_at: Clock.utc_now()
      }

  def trigger(alarm) do
    alarm.callback.(alarm)
    alarm
  end

  defp default_callback(alarm) do
    IO.puts("Alarm '#{alarm.name}' was triggered!")
  end

  def status(alarm) do
    {alarm.name, alarm.duration, remaining(alarm)}
  end

  defp remaining(alarm) do
    alarm.created_at
    |> NaiveDateTime.add(alarm.duration, :millisecond)
    |> NaiveDateTime.diff(Clock.utc_now(), :millisecond)
  end
end
