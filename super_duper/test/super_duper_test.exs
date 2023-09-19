defmodule SuperDuperTest do
  use ExUnit.Case

  describe "add_character/2" do
    test "starts another character in a supervised process" do
      {:ok, _pid} = SuperDuper.add_character(:dude, "abides")
      assert SuperDuper.say(:dude) == "abides"
    end
  end

  describe "say/1" do
    test "responds with a given character's phrase" do
      assert SuperDuper.say(:supermario) == "Hoo hoo! Just what I needed!"
    end
  end

  describe "kill/1" do
    test "kill the process" do
      assert :ok = SuperDuper.kill(:superman)
    end
  end

  describe "remove_character/1" do
    test "removes character" do
      {:ok, _pid} = SuperDuper.add_character(:dead_man_walking, "ua??")
      assert is_pid(GenServer.whereis(:dead_man_walking))

      SuperDuper.remove_character(:dead_man_walking)
      refute is_pid(GenServer.whereis(:dead_man_walking))
      assert Enum.empty?(DynamicSupervisor.which_children(SuperDuper.DynamicSupervisor))
    end
  end
end
