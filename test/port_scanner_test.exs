defmodule PortScannerTest do
  use ExUnit.Case
  doctest PortScanner

  test "greets the world" do
    assert PortScanner.hello() == :world
  end
end
