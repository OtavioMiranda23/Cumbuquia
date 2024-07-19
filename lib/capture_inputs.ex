defmodule CaptureInputs do
@spec get_names() :: list()
  def get_names() do
    get_names([])
  end

  @spec get_names(list(String.t())) :: list(String.t())
  defp get_names(names_acc) do
    input = IO.gets("")
    handle_input(input, names_acc)
  end

  @spec handle_input(String.t(), list(String.t())) :: list(String.t())
  defp handle_input("\n", names_acc), do: Enum.reverse(names_acc)

  @spec handle_input(String.t(), list(String.t())) :: list(String.t())
  defp handle_input(name, names_acc) do
    name_trim = String.trim(name)
    get_names([name_trim | names_acc])
  end
end
