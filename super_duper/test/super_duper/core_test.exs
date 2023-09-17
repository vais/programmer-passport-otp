defmodule SuperDuper.CoreTest do
  use ExUnit.Case

  alias SuperDuper.Core

  describe "info/1" do
    test "returns the phrase for supermario" do
      phrase = "Hoo hoo! Just what I needed!"
      assert Core.info(:supermario) == {:supermario, phrase}
    end

    test "returns the phrase for superdave" do
      phrase = "Next time you shoot a bullet at a metal object, watch the ricochet."
      assert Core.info(:superdave) == {:superdave, phrase}
    end

    test "returns the phrase for superman" do
      phrase = "It doesn't take X-Ray Vision to see you are up to no good."
      assert Core.info(:superman) == {:superman, phrase}
    end
  end
end
