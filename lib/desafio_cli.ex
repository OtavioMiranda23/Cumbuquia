defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts("--------------********------------")
    IO.puts("Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!")
    IO.puts("--------------********------------")
    IO.puts("Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!")

    names = get_name()
    IO.inspect(names)
  end

  @doc """
  Coleta nomes inseridos pelo usuário até que uma linha vazia seja inserida.
  Retorna uma lista de nomes em ordem reversa.
  """
  def get_name(names_acc \\ [], read_fn \\ &IO.gets/1) do
    input = read_fn.("")
    handle_input(input, names_acc, read_fn)
  end

  defp handle_input("\n", names_acc, _read_fn) do
    Enum.reverse(names_acc)
    # TODO: Sort => Algarismos
  end

  defp handle_input(name, names_acc, read_fn) do
    name
    |> String.trim()
    |> add_to_acc(names_acc)
    |> get_name(read_fn)
  end

  defp add_to_acc(name, names_acc) do
    [name | names_acc]
  end
end
