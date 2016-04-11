defmodule HrefSignalTest do
  use ExUnit.Case

  use Hound.Helpers

  hound_session

  test "it listens to hash changes" do
    TestHelpers.wait(300)

    navigate_to("/Main.elm")

    # Given current signal is empty
    TestHelpers.assert_label("href", "")

    # When the location changes
    navigate_to("/Main.elm#monkeys")
    TestHelpers.wait(200)

    # Then we should receive a signal
    TestHelpers.assert_label("href", "http://test_app:8000/Main.elm#monkeys")
  end

  # query changes cannot be tested because setting the query string generates a page refresh

  test "it triggers after a path change" do
    TestHelpers.wait(300)

    navigate_to("/Main.elm")

    # Given current signal is empty
    TestHelpers.assert_label("href", "")

    # When setPath is triggered
    TestHelpers.clickSetPath()

    # Then we should receive a signal
    TestHelpers.assert_label("href", "http://test_app:8000/monkeys")
  end

  test "it triggers after a hash change" do
    TestHelpers.wait(300)

    navigate_to("/Main.elm")

    # Given current signal is empty
    TestHelpers.assert_label("href", "")

    # When setPath is triggered
    TestHelpers.clickSetHash()

    # Then we should receive a signal
    TestHelpers.assert_label("href", "http://test_app:8000/Main.elm#monkeys")
  end

end
