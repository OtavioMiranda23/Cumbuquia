defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @spec main(any()) :: :ok
  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    IO.puts("Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!")
    IO.puts("Insira o nome de suas majestades, um por linha.")
    IO.puts("Quando terminar, pressione enter em uma linha vazia!")

    CaptureInputs.get_names()
    |> FrequenciesCounter.calculate_frequencies()
    |> Enum.map(fn {majesty, num } -> RomainNumerals.to_romain(num, majesty) end)
    |> Enum.each(&IO.puts/1)
  end
end
