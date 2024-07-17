defmodule DesafioCliTest do
  use ExUnit.Case
  doctest DesafioCli

  test "get_name with a list of names and an empty line at the end" do
    inputs = ["Eduardo\n", "Maria\n", "Daniel\n", "\n"]

    read_fn = fn _ ->
      case Process.get(:inputs, []) do
        [head | tail] ->
          Process.put(:inputs, tail)
          head
        [] ->
          "\n"
      end
    end

    Process.put(:inputs, inputs)
    expected = ["Eduardo", "Maria", "Daniel"]

    assert DesafioCli.get_name([], read_fn) == expected
  end
end
