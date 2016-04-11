defmodule TestHelpers do
  use ExUnit.Case
  use Hound.Helpers

  def wait(ms) do
    :timer.sleep(ms)
  end

  def assert_label(id, text) do
    label = find_element(:id, id)
    assert inner_html(label) == text
  end

  # btnSetPath calls `setPath "/monkeys"`
  def clickSetPath do
    btn = find_element(:id, "btnSetPath")
    click(btn)
    wait(200)
  end

  def clickSetHash do
    btn = find_element(:id, "btnSetHash")
    click(btn)
    wait(200)
  end

end
