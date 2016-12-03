defmodule Day03 do
  def solve(input, input_fun \\ &Day03.rows/1) do
    Enum.reduce(input_fun.(input), 0, &handle/2)
  end

  defp handle("", acc), do: acc
  defp handle(string, acc) when is_binary(string) do
    row = String.split(string)
    handle(row, acc)
  end
  defp handle([x, y, z], acc) do
    a = String.to_integer(x)
    b = String.to_integer(y)
    c = String.to_integer(z)
    case (a + b > c) and (a + c > b) and (b + c > a) do
      true -> 1 + acc
      false -> acc
    end
  end

  def rows(input) do
    String.split(input, "\n")
  end

  def columns(input) do
    columns_to_rows(rows(input), [])
  end

  def columns_to_rows([""], acc), do: acc
  def columns_to_rows([r1, r2, r3 | rest], acc) do
    [x1, y1, z1] = String.split(r1)
    [x2, y2, z2] = String.split(r2)
    [x3, y3, z3] = String.split(r3)
    a = [[x1, x2, x3], [y1, y2, y3], [z1, z2, z3] | acc]
    columns_to_rows(rest, a)
  end
end
