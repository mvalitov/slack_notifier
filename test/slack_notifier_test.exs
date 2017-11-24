defmodule SlackNotifierTest do
  use ExUnit.Case
  doctest SlackNotifier

  test "greets the world" do
    assert SlackNotifier.hello() == :world
  end
end
