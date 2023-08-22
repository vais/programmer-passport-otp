defmodule Clock do
  use GenServer

  def init(state) do
    schedule_next_tick()
    {:ok, state}
  end

  defp schedule_next_tick() do
    Process.send_after(self(), :tick, 1000)
  end

  def handle_info(:tick, state) do
    NaiveDateTime.local_now()
    |> NaiveDateTime.to_time()
    |> Time.to_string()
    |> IO.puts()

    schedule_next_tick()
    {:noreply, state}
  end
end
