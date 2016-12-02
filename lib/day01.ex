defmodule Day01 do
  # Start (0,0) and facing N

  def update_position(state = %{x: x, facing: :n}, "R" <> num) do
    delta = String.to_integer(num)
    %{state | x: x + delta, facing: :e, nodes: visit_nodes(state, :x, delta)}
  end
  def update_position(state = %{x: x, facing: :n}, "L" <> num) do
    delta = String.to_integer(num)
    %{state | x: x - delta, facing: :w, nodes: visit_nodes(state, :x, -delta)}
  end
  def update_position(state = %{x: x, facing: :s}, "R" <> num) do
    delta = String.to_integer(num)
    %{state | x: x - delta, facing: :w, nodes: visit_nodes(state, :x, -delta)}
  end
  def update_position(state = %{x: x, facing: :s}, "L" <> num) do
    delta = String.to_integer(num)
    %{state | x: x + delta, facing: :e, nodes: visit_nodes(state, :x, delta)}
  end
  def update_position(state = %{y: y, facing: :w}, "R" <> num) do
    delta = String.to_integer(num)
    %{state | y: y + delta, facing: :n, nodes: visit_nodes(state, :y, delta)}
  end
  def update_position(state = %{y: y, facing: :w}, "L" <> num) do
    delta = String.to_integer(num)
    %{state | y: y - delta, facing: :s, nodes: visit_nodes(state, :y, -delta)}
  end
  def update_position(state = %{y: y, facing: :e}, "R" <> num) do
    delta = String.to_integer(num)
    %{state | y: y - delta, facing: :s, nodes: visit_nodes(state, :y, -delta)}
  end
  def update_position(state = %{y: y, facing: :e}, "L" <> num) do
    delta = String.to_integer(num)
    %{state | y: y + delta, facing: :n, nodes: visit_nodes(state, :y, delta)}
  end

  def visit_nodes(%{nodes: n} = _state, _, 0) do
    n
  end
  def visit_nodes(%{x: x, y: y, nodes: n} = state, :x, delta) when delta > 0 do
    new_x = x + 1
    nn = update(n, new_x, y)
    visit_nodes(%{state | x: new_x, nodes: nn}, :x, delta - 1)
  end
  def visit_nodes(%{x: x, y: y, nodes: n} = state, :x, delta) when delta < 0 do
    new_x = x - 1
    nn = update(n, new_x, y)
    visit_nodes(%{state | x: new_x, nodes: nn}, :x, delta + 1)
  end
  def visit_nodes(%{x: x, y: y, nodes: n} = state, :y, delta) when delta > 0 do
    new_y = y + 1
    nn = update(n, x, new_y)
    visit_nodes(%{state | y: new_y, nodes: nn}, :y, delta - 1)
  end
  def visit_nodes(%{x: x, y: y, nodes: n} = state, :y, delta) when delta < 0 do
    new_y = y - 1
    nn = update(n, x, new_y)
    visit_nodes(%{state | y: new_y, nodes: nn}, :y, delta + 1)
  end

  defp update(n, x, y) do
    case MapSet.member?(n, %{x: x, y: y}) do
      true ->
        final_pos(x, y)
        n
      false ->
        MapSet.put(n, %{x: x, y: y})
    end
  end

  defp final_pos(x, y) do
    IO.puts "Final position: {#{x}, #{y}}, distance: #{abs(x) + abs(y)}"
  end

  def part1 do
    {:ok, file} = File.read("lib/day01.input")
    nodes = String.split(String.trim(file), ", ")
    acc = Enum.reduce(nodes, %{x: 0, y: 0, facing: :n,
                               nodes: MapSet.put(MapSet.new, %{x: 0, y: 0})},
      fn(x, acc) -> update_position(acc, x) end)
    x = Map.get(acc, :x)
    y = Map.get(acc, :y)
    IO.puts "Final position: {#{x}, #{y}}, distance: #{x + y}"
  end

  def find_pos(path) do
    nodes = String.split(String.trim(path), ", ")
    Enum.reduce(nodes, %{x: 0, y: 0, facing: :n,
                         nodes: MapSet.put(MapSet.new, %{x: 0, y: 0})},
      fn(z, acc) ->
        update_position(acc, z)
      end)
  end
end
