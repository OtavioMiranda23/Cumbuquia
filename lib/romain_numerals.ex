defmodule RomainNumerals do
  @romain_numerals_list [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @spec to_romain(non_neg_integer(), String.t()) :: nonempty_binary()
  def to_romain(target_num, majesty), do: to_romain(target_num, majesty, @romain_numerals_list, "")

  defp to_romain(0, majesty, _rest, result), do: "#{majesty} #{result}"

  @spec to_romain(non_neg_integer(), String.t(), list({non_neg_integer(), String.t()}), String.t()) :: nonempty_binary()
  defp to_romain(target_num, majesty, [{arabian, romain} | rest], result) when target_num >= arabian do
    to_romain(target_num - arabian, majesty, [{arabian, romain} | rest], result <> romain)
  end

  defp to_romain(target_num, majesty, [_ | rest], result) do
    to_romain(target_num, majesty, rest, result)
  end
end
