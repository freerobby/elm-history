defmodule SetHashTest do
  use ExUnit.Case

  use Hound.Helpers

  hound_session

  test "it changes the hash" do
    TestHelpers.wait(300)
    navigate_to("/Main.elm")

    # When setHash is called
    TestHelpers.clickSetHash()

    # Then the hash should be changed
    actual = execute_script("return window.location.hash")

    assert actual == "#monkeys"
  end

end
