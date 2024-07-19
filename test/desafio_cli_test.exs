defmodule DesafioCliTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "main/1" do
    test "imprime nomes formatados do primeiro exemplo:" do
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

    test "imprime nomes formatados do segundo exemplo:" do
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
    test "imprime nomes formatados com entradas enormes" do
      input = """
      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\nbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n
      """
      output = capture_io([input: input, capture_prompt: false], fn -> DesafioCli.main([]) end)

      expected_output = """
      Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!
      Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!
      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa I
      aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa II
      bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb I
      """
      assert normalize_line_endings(output) == normalize_line_endings(expected_output)
    end

    test "responde a entrada vazia:" do
      input = "\n"
      output = capture_io([input: input, capture_prompt: false], fn -> DesafioCli.main([]) end)

      expected_output = """
      Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!
      Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!
      """

      assert normalize_line_endings(output) == normalize_line_endings(expected_output)
    end

    test "imprime nomes formatados com 100 repetições" do
      input = String.duplicate("a\n", 100) <> "\n"
      output = capture_io([input: input, capture_prompt: false], fn -> DesafioCli.main([]) end)

      expected_names = Enum.map(1..100, fn n -> "a #{n_to_roman(n)}" end) |> Enum.join("\n")
      expected_output = """
      Olá! Bem-vindo ao numerador de reis e rainhas de Cumbuquia!
      Insira o nome de suas majestades, um por linha. Quando terminar, pressione enter em uma linha vazia!
      """ <> expected_names <> "\n"

      assert normalize_line_endings(output) == normalize_line_endings(expected_output)
    end

    test "responde a entrada única:" do
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
    test "coleta nomes antes do enter:" do
      input = "Alice\nBob\n\n"
      output = capture_io([input: input, capture_prompt: false], fn ->
        names = CaptureInputs.get_names()
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

  defp n_to_roman(n) do
    case n do
      1 -> "I"
      2 -> "II"
      3 -> "III"
      4 -> "IV"
      5 -> "V"
      6 -> "VI"
      7 -> "VII"
      8 -> "VIII"
      9 -> "IX"
      10 -> "X"
      11 -> "XI"
      12 -> "XII"
      13 -> "XIII"
      14 -> "XIV"
      15 -> "XV"
      16 -> "XVI"
      17 -> "XVII"
      18 -> "XVIII"
      19 -> "XIX"
      20 -> "XX"
      21 -> "XXI"
      22 -> "XXII"
      23 -> "XXIII"
      24 -> "XXIV"
      25 -> "XXV"
      26 -> "XXVI"
      27 -> "XXVII"
      28 -> "XXVIII"
      29 -> "XXIX"
      30 -> "XXX"
      31 -> "XXXI"
      32 -> "XXXII"
      33 -> "XXXIII"
      34 -> "XXXIV"
      35 -> "XXXV"
      36 -> "XXXVI"
      37 -> "XXXVII"
      38 -> "XXXVIII"
      39 -> "XXXIX"
      40 -> "XL"
      41 -> "XLI"
      42 -> "XLII"
      43 -> "XLIII"
      44 -> "XLIV"
      45 -> "XLV"
      46 -> "XLVI"
      47 -> "XLVII"
      48 -> "XLVIII"
      49 -> "XLIX"
      50 -> "L"
      51 -> "LI"
      52 -> "LII"
      53 -> "LIII"
      54 -> "LIV"
      55 -> "LV"
      56 -> "LVI"
      57 -> "LVII"
      58 -> "LVIII"
      59 -> "LIX"
      60 -> "LX"
      61 -> "LXI"
      62 -> "LXII"
      63 -> "LXIII"
      64 -> "LXIV"
      65 -> "LXV"
      66 -> "LXVI"
      67 -> "LXVII"
      68 -> "LXVIII"
      69 -> "LXIX"
      70 -> "LXX"
      71 -> "LXXI"
      72 -> "LXXII"
      73 -> "LXXIII"
      74 -> "LXXIV"
      75 -> "LXXV"
      76 -> "LXXVI"
      77 -> "LXXVII"
      78 -> "LXXVIII"
      79 -> "LXXIX"
      80 -> "LXXX"
      81 -> "LXXXI"
      82 -> "LXXXII"
      83 -> "LXXXIII"
      84 -> "LXXXIV"
      85 -> "LXXXV"
      86 -> "LXXXVI"
      87 -> "LXXXVII"
      88 -> "LXXXVIII"
      89 -> "LXXXIX"
      90 -> "XC"
      91 -> "XCI"
      92 -> "XCII"
      93 -> "XCIII"
      94 -> "XCIV"
      95 -> "XCV"
      96 -> "XCVI"
      97 -> "XCVII"
      98 -> "XCVIII"
      99 -> "XCIX"
      100 -> "C"
    end
  end
end
