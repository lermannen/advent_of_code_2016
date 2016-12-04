defmodule Day04 do
  def transform(string) do
    name = String.slice(string, 0..-12)
    sector = String.slice(string, -10..-8)
    checksum = String.slice(string, -6..-2)
   # IO.puts "#{string}: #{name} | #{sector} | #{checksum}"
    %{name: String.replace(name, "-", ""), sector: sector, checksum: checksum}
  end

  def real_room?(%{name: name, checksum: checksum}) do
    x = Enum.sort(String.graphemes(name))
    map = Enum.reduce(x, %{}, fn(x, acc) -> Map.update(acc, x, 1, &(&1 + 1)) end)
    sorted = Enum.sort(map, fn({k1, x}, {k2, y}) -> case x == y do; true -> k1 < k2; false -> x > y; end; end)
    real_checksum = Enum.join(Enum.map(Enum.take(sorted, 5), fn({k, _v}) -> k end))
    checksum == real_checksum
  end

  def sector(room = %{sector: sector}) do
    case real_room?(room) do
      true -> String.to_integer(sector)
      false -> 0
    end
  end

  def solve(input) do
    rooms = String.split(input, "\n")
    Enum.reduce(rooms, 0, fn(x, acc) -> sector(transform(x)) + acc end)
  end
end
