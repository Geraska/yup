defmodule YupTest do
  use ExUnit.Case
  doctest Yup

  test "greets the world" do
    assert Yup.hello() == :world
  end
end
