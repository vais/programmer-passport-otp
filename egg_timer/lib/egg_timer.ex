defmodule EggTimer do
  alias EggTimer.Server
  alias EggTimer.Alarm

  def start_link(alarms) do
    GenServer.start_link(Server, alarms)
  end

  def schedule(pid, name, duration) do
    alarm = Alarm.new(name, duration)
    GenServer.cast(pid, {:schedule, alarm})
  end

  def schedule(pid, name, duration, callback) do
    alarm = Alarm.new(name, duration, callback)
    GenServer.cast(pid, {:schedule, alarm})
  end

  def status(pid) do
    GenServer.call(pid, :status)
  end

  def stop(pid) do
    GenServer.cast(pid, :stop)
  end
end
