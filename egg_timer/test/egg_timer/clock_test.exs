defmodule EggTimer.ClockTest do
  use ExUnit.Case, async: true

  alias EggTimer.Clock

  test "rigs the clock to return a given time" do
    utc_now = ~N[2023-09-04 19:07:22.458529]
    refute Clock.utc_now() == utc_now

    assert Clock.freeze(utc_now) == utc_now
    assert Clock.utc_now() == utc_now

    Clock.unfreeze()
    refute Clock.utc_now() == utc_now

    utc_now = Clock.freeze()
    assert Clock.utc_now() == utc_now

    Clock.unfreeze()
    refute Clock.utc_now() == utc_now
  end
end
