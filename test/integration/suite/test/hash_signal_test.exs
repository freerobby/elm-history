defmodule HashSignalTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session

  test "it listens to the hash change" do
    TestHelpers.wait(300)

    navigate_to("/Main.elm")

    # Given current signal is empty
    TestHelpers.assert_label("hash", "")

    # When the hash changes
    navigate_to("/Main.elm#monkeys")
    TestHelpers.wait(200)

    # Then we should receive a signal
    TestHelpers.assert_label("hash", "#monkeys")
  end

end
