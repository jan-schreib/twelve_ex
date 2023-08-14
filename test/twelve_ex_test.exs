defmodule TwelveExTest do
  use ExUnit.Case
  doctest TwelveEx

  test "greets the world" do
    assert TwelveEx.hello() == :world
  end
end
