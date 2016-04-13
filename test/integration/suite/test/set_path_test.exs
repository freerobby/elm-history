defmodule SetPathTest do
  use ExUnit.Case

  use Hound.Helpers

  hound_session

  test "it changes the path" do
    TestHelpers.wait(300)
    navigate_to("/Main.elm")

    # When setPath is called
    TestHelpers.clickSetPath()

    # Then the pathname should be changed
    actual = execute_script("return window.location.pathname")

    assert actual == "/monkeys"
  end

end
