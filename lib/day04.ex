defmodule Day04 do
  def transform(string) do
    name = String.slice(string, 0..-12)
    sector = String.slice(string, -10..-8)
    checksum = String.slice(string, -6..-2)
   # IO.puts "#{string}: #{name} | #{sector} | #{checksum}"
    %{name: name, sector: String.to_integer(sector), checksum: checksum}
  end

  def real_room?(%{name: name, checksum: checksum}) do
    x = Enum.sort(String.graphemes(String.replace(name, "-", "")))
    map = Enum.reduce(x, %{}, fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end)
    sorted = Enum.sort(map, fn({k1, x}, {k2, y}) -> case x == y do; true -> k1 < k2; false -> x > y; end; end)
    real_checksum = Enum.join(Enum.map(Enum.take(sorted, 5), fn({k, _v}) -> k end))
    checksum == real_checksum
  end

  def sector(room = %{sector: sector}) do
    case real_room?(room) do
      true -> sector
      false -> 0
    end
  end

  def solve(input) do
    rooms = String.split(input, "\n")
    Enum.reduce(rooms, 0, fn(x, acc) -> sector(transform(x)) + acc end)
  end

  def solve2(input) do
    rooms = Enum.reject(String.split(input, "\n"), fn(x) -> !real_room?(transform(x)) end)
    decoded = Enum.map(rooms, fn(r) -> %{decoded: decrypt(transform(r)), name: r} end)
#    IO.inspect decoded
    filter(decoded)
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
    Enum.join(Enum.map(String.codepoints(name), fn(x) -> Day04.decode(x, rem(sector, 26)) end))
  end

  def decode("-", _), do: " "
  def decode(<< c >>, value) when c + value > 122, do: << c + value - 26 >>
  def decode(<< c >>, value), do: << c + value >>
end
