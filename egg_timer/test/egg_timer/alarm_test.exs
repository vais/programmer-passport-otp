defmodule EggTimer.AlarmTest do
  use ExUnit.Case, async: true

  alias ExUnit.CaptureIO
  alias EggTimer.Alarm
  alias EggTimer.Clock

  describe "trigger/1" do
    test "custom callback" do
      callback = fn _ -> send(self(), :callback_was_called) end
      alarm = Alarm.new(:"some alarm", 1000, callback)
      Alarm.trigger(alarm)
      assert_received :callback_was_called
    end

    test "default callback" do
      alarm = Alarm.new(:"wake up", 1000)
      io = CaptureIO.capture_io(fn -> Alarm.trigger(alarm) end)
      assert io == "Alarm 'wake up' was triggered!\n"
    end

    test "twice in a row" do
      alarm = Alarm.new(:"hi there", 1000)

      io =
        CaptureIO.capture_io(fn ->
          alarm
          |> Alarm.trigger()
          |> Alarm.trigger()
        end)

      assert io == String.duplicate("Alarm 'hi there' was triggered!\n", 2)
    end
  end

  describe "status/1" do
    test "returns alarm info" do
      created_at = Clock.freeze()

      alarm = Alarm.new(:test, 10_000)

      created_at
      |> NaiveDateTime.add(4_000, :millisecond)
      |> Clock.freeze()

      status = Alarm.status(alarm)

      assert status == {:test, 10_000, 6_000}
    end
  end
end
