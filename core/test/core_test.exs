defmodule Faas.CoreTest do
  use ExUnit.Case
  doctest Faas.Core

  test "greets the world" do
    assert Faas.Core.hello() == :world
  end
end
