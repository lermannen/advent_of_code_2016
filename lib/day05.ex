defmodule Day05 do
  def find_hash(data) do
    map = find_hash(data, 0, md5(data), 0, %{})
    map
    |> Map.values
    |> Enum.join
    |> IO.puts
  end

  def find_hash(_data, _index, _hash, 8, map), do: map
  def find_hash(data, index, hash = "00000" <> _rest, _found, map) do
    {map, found} = update_map(map, String.at(hash, 5), String.at(hash, 6))
    IO.puts "Found potential match # #{found}"
    find_hash(data, index + 1, md5("#{data}#{index + 1}"), found, map)
  end
  def find_hash(data, index, _hash, found, map) do
    find_hash(data, index + 1, md5("#{data}#{index + 1}"), found, map)
  end

  def md5(data) do
    Base.encode16(:erlang.md5(data), case: :lower)
  end

  def update_map(map, index, char) when index >= "0" and index < "8" do
    map = case Map.has_key?(map, index) do
            true -> map
            false -> Map.put(map, index, char)
          end
    {map, length(Map.values(map))}
  end
  def update_map(map, _index, _char), do: {map, length(Map.values(map))}
end
