defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts("Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!")
    IO.puts("Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!")

    get_names()
    |> IO.inspect()
    |> count_frequencies()
    |> IO.inspect()
    |> Enum.map(fn {majesty, num } -> RomainNumerals.to_romain(num, majesty) end)
    |> IO.inspect()

  end

  @doc """
  Coleta nomes inseridos pelo usuário até que uma linha vazia seja inserida.
  Retorna uma lista de nomes em ordem reversa.
  """
  @spec get_names() :: list()
  def get_names do
    get_names([])
  end

  defp get_names(names_acc) do
    input = IO.gets("")
    handle_input(input, names_acc)
  end

  defp handle_input("\n", names_acc), do: Enum.reverse(names_acc)

  defp handle_input(name, names_acc) do
    name
    |> String.trim()
    |> add_to_acc(names_acc)
    |> get_names()
  end

  defp add_to_acc(name, names_acc) do
    [name | names_acc]
  end

  defp count_frequencies(list), do: count_frequencies(list, %{}, [])

  defp count_frequencies([], _counter, result), do: Enum.reverse(result)

  defp count_frequencies([item | rest], counts, result) do
    count = Map.get(counts, item, 0) + 1
    new_counts = Map.put(counts, item, count)
    new_result = [{item, count} | result]
    count_frequencies(rest, new_counts, new_result)
  end
end
