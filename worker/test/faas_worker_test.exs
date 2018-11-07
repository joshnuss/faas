defmodule Faas.WorkerTest do
  use ExUnit.Case
  doctest Faas.Worker

  test "greets the world" do
    assert Faas.Worker.hello() == :world
  end
end
