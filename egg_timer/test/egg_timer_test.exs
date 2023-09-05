defmodule EggTimerTest do
  use ExUnit.Case, async: true

  describe "schedule/2" do
    test "schedules an alarm" do
      {:ok, pid} = EggTimer.start_link(nil)

      me = self()
      callback = fn a -> send(me, "#{a.name} was triggered") end
      message = "test_alarm was triggered"

      :ok = EggTimer.schedule(pid, :test_alarm, 10, callback)

      refute_receive ^message, 5
      assert_receive ^message
    end
  end

  describe "status/1" do
    test "returns a list of all scheduled alarms" do
      {:ok, pid} = EggTimer.start_link(nil)

      :ok = EggTimer.schedule(pid, :alarm1, 1000)
      :ok = EggTimer.schedule(pid, :alarm2, 2000)

      result = EggTimer.status(pid) |> Enum.sort()

      assert {:alarm1, 1000, _} = List.first(result)
      assert {:alarm2, 2000, _} = List.last(result)
    end
  end

  describe "stop/1" do
    test "stops the server" do
      {:ok, pid} = EggTimer.start_link(nil)
      assert Process.alive?(pid)

      :ok = EggTimer.stop(pid)

      Process.flag(:trap_exit, true)
      assert_receive({:EXIT, ^pid, :normal})
      refute Process.alive?(pid)
    end
  end
end
