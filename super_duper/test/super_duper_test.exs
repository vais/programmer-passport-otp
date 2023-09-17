defmodule SuperDuperTest do
  use ExUnit.Case

  describe "say/1" do
    test "responds with a given character's phrase" do
      assert SuperDuper.say(:supermario) == "Hoo hoo! Just what I needed!"
    end
  end

  describe "kill/1" do
    test "kill the process" do
      assert :ok = SuperDuper.kill(:supermario)
    end
  end
end
