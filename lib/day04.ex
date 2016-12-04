defmodule Day04 do
  def transform(string) do
    name = String.slice(string, 0..-12)
    sector = String.slice(string, -10..-8)
    checksum = String.slice(string, -6..-2)
    %{name: name, sector: String.to_integer(sector), checksum: checksum}
  end

  def real_room?(%{name: name, checksum: checksum}) do
    real_checksum = name
    |> String.replace("-", "")
    |> String.graphemes
    |> Enum.sort
    |> Enum.reduce(%{}, fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Enum.sort(&sort_letters/2)
    |> Enum.take(5)
    |> Enum.map(fn({k, _v}) -> k end)
    |> Enum.join
    checksum == real_checksum
  end

  defp sort_letters({k1, x}, {k2, y}) do
    case x == y do
      true -> k1 < k2
      false -> x > y
    end
  end

  def sector(room = %{sector: sector}) do
    case real_room?(room) do
      true -> sector
      false -> 0
    end
  end

  def solve(input) do
    input
    |> String.split("\n")
    |> Enum.reduce(0, fn(x, acc) -> sector(transform(x)) + acc end)
  end

  def solve2(input) do
    input
    |> String.split("\n")
    |> Enum.reject(fn(x) -> !real_room?(transform(x)) end)
    |> Enum.map(fn(r) -> %{decoded: decrypt(transform(r)), name: r} end)
    |> filter
  end

  defp filter([]), do: :ok
  defp filter([%{decoded: d, name: n} | rest]) do
    case String.starts_with?(d, "north") do
      true -> IO.puts "#{d}, originally: #{n}"
      false -> :ok
    end
    filter(rest)
  end
  defp filter(_), do: :ok

  def decrypt(%{name: name, sector: sector}) do
    name
    |> String.codepoints
    |> Enum.map(fn(x) -> Day04.decode(x, rem(sector, 26)) end)
    |> Enum.join
  end

  def decode("-", _), do: " "
  def decode(<< c >>, value) when c + value > 122, do: << c + value - 26 >>
  def decode(<< c >>, value), do: << c + value >>
end
