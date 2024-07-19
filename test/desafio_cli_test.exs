defmodule DesafioCliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "main/1" do
    test "prints the formatted names and their roman numerals for the first example" do
      input = "Eduardo\nMaria\nDaniel\nEduardo\n\n"
      output = capture_io([input: input, capture_prompt: false], fn -> DesafioCli.main([]) end)

      expected_output = """
      Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!
      Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!
      Eduardo I
      Maria I
      Daniel I
      Eduardo II
      """

      assert normalize_line_endings(output) == normalize_line_endings(expected_output)
    end

    test "prints the formatted names and their roman numerals for the second example" do
      input = "João\nJoão\nJoão\nJoão\n\n"
      output = capture_io([input: input, capture_prompt: false], fn -> DesafioCli.main([]) end)

      expected_output = """
      Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!
      Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!
      João I
      João II
      João III
      João IV
      """

      assert normalize_line_endings(output) == normalize_line_endings(expected_output)
    end

    test "handles empty input gracefully" do
      input = "\n"
      output = capture_io([input: input, capture_prompt: false], fn -> DesafioCli.main([]) end)

      expected_output = """
      Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!
      Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!
      """

      assert normalize_line_endings(output) == normalize_line_endings(expected_output)
    end

    test "handles single name input" do
      input = "Alice\n\n"
      output = capture_io([input: input, capture_prompt: false], fn -> DesafioCli.main([]) end)

      expected_output = """
      Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!
      Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!
      Alice I
      """

      assert normalize_line_endings(output) == normalize_line_endings(expected_output)
    end
  end

  describe "get_names/0" do
    test "collects names until an empty line is entered" do
      input = "Alice\nBob\n\n"
      output = capture_io([input: input, capture_prompt: false], fn ->
        names = DesafioCli.get_names()
        assert names == ["Alice", "Bob"]
      end)

      assert output == ""
    end
  end

  describe "FrequenciesCounter.calculate_frequencies/1" do
    test "calculates frequencies correctly" do
      input = ["Alice", "Bob", "Alice"]
      output = FrequenciesCounter.calculate_frequencies(input)

      assert output == [{"Alice", 1}, {"Bob", 1}, {"Alice", 2}]
    end
  end

  describe "RomainNumerals.to_romain/2" do
    test "converts number to roman numerals correctly" do
      assert RomainNumerals.to_romain(1, "Alice") == "Alice I"
      assert RomainNumerals.to_romain(4, "Bob") == "Bob IV"
      assert RomainNumerals.to_romain(9, "Charlie") == "Charlie IX"
      assert RomainNumerals.to_romain(58, "Dave") == "Dave LVIII"
      assert RomainNumerals.to_romain(1990, "Eve") == "Eve MCMXC"
    end
  end

  defp normalize_line_endings(text) do
    text
    |> String.replace("\r\n", "\n")
    |> String.trim()
  end
end
