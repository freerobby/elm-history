defmodule PathSignalTest do
  use ExUnit.Case

  use Hound.Helpers

  hound_session

  test "it listens to the path change" do
    TestHelpers.wait(300)

    navigate_to("/Main.elm")

    # Given current signal is empty
    TestHelpers.assert_label("path", "")

    # When the path changes
    TestHelpers.clickSetPath()

    # Then we should receive a signal
    TestHelpers.assert_label("path", "/monkeys")
  end

end
