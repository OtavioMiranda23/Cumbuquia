defmodule FrequenciesCounter do
  @spec calculate_frequencies(list(String.t())) :: list()
  def calculate_frequencies(list), do: calculate_frequencies(list, %{}, [])

  @spec calculate_frequencies(list(String.t()), map(), list({String.t(), non_neg_integer()})) :: list({String.t(), non_neg_integer()})
  defp calculate_frequencies([], _counter, result), do: Enum.reverse(result)

  defp calculate_frequencies([item | rest], counts, result) do
    count = Map.get(counts, item, 0) + 1
    new_counts = Map.put(counts, item, count)
    new_result = [{item, count} | result]
    calculate_frequencies(rest, new_counts, new_result)
  end
end
