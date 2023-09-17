defmodule SuperDuper.ApplicationTest do
  use ExUnit.Case

  test "starts up automatically" do
    assert {:error, {:already_started, pid}} = SuperDuper.Application.start(:beep, :boop)
    assert GenServer.whereis(SuperDuper.Supervisor) == pid
  end

  test "starts and restarts its children" do
    pids = [
      GenServer.whereis(:supermario),
      GenServer.whereis(:superdave),
      GenServer.whereis(:superman)
    ]

    assert Enum.all?(pids, &is_pid/1)

    SuperDuper.kill(:supermario)
    Process.sleep(100)

    new_pids = [
      GenServer.whereis(:supermario),
      GenServer.whereis(:superdave),
      GenServer.whereis(:superman)
    ]

    assert Enum.all?(new_pids, &is_pid/1)
    assert hd(pids) != hd(new_pids)
    assert tl(pids) == tl(new_pids)
  end
end
