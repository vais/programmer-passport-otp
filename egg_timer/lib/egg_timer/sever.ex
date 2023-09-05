defmodule EggTimer.Server do
  use GenServer

  alias EggTimer.Alarm

  def init(_) do
    {:ok, %{}}
  end

  def handle_cast({:schedule, alarm}, state) do
    state = Map.put(state, alarm.name, alarm)
    Process.send_after(self(), {:trigger, alarm}, alarm.duration)
    {:noreply, state}
  end

  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  def handle_info({:trigger, alarm}, state) do
    Alarm.trigger(alarm)
    {:noreply, state}
  end

  def handle_call(:status, _from, state) do
    status = Map.values(state) |> Enum.map(&Alarm.status(&1))
    {:reply, status, state}
  end
end
