defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  setup do
    {:ok, [state: %{x: 0, y: 0, facing: :n,
                    nodes: MapSet.put(MapSet.new, %{x: 0, y: 0})}]}
  end

  test "update position facing north go right", context do
    pos = Day01.update_position(context[:state], "R5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 1, y: 0})
    |> MapSet.put(%{x: 2, y: 0})
    |> MapSet.put(%{x: 3, y: 0})
    |> MapSet.put(%{x: 4, y: 0})
    |> MapSet.put(%{x: 5, y: 0})
    assert %{x: 5, y: 0, facing: :e, nodes: nodes} == pos
  end

  test "update position facing north go left", context do
    pos = Day01.update_position(context[:state], "L5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: -1, y: 0})
    |> MapSet.put(%{x: -2, y: 0})
    |> MapSet.put(%{x: -3, y: 0})
    |> MapSet.put(%{x: -4, y: 0})
    |> MapSet.put(%{x: -5, y: 0})
    assert %{x: -5, y: 0, facing: :w, nodes: nodes} == pos
  end

  test "update position facing south go right", context do
    pos = Day01.update_position(%{context[:state] | facing: :s}, "R5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: -1, y: 0})
    |> MapSet.put(%{x: -2, y: 0})
    |> MapSet.put(%{x: -3, y: 0})
    |> MapSet.put(%{x: -4, y: 0})
    |> MapSet.put(%{x: -5, y: 0})
    assert %{x: -5, y: 0, facing: :w, nodes: nodes} == pos
  end

  test "update position facing south go left", context do
    pos = Day01.update_position(%{context[:state] | facing: :s}, "L5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 1, y: 0})
    |> MapSet.put(%{x: 2, y: 0})
    |> MapSet.put(%{x: 3, y: 0})
    |> MapSet.put(%{x: 4, y: 0})
    |> MapSet.put(%{x: 5, y: 0})
    assert %{x: 5, y: 0, facing: :e, nodes: nodes} == pos
  end

  test "update position facing west go right", context do
    pos = Day01.update_position(%{context[:state] | facing: :w}, "R5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 0, y: 1})
    |> MapSet.put(%{x: 0, y: 2})
    |> MapSet.put(%{x: 0, y: 3})
    |> MapSet.put(%{x: 0, y: 4})
    |> MapSet.put(%{x: 0, y: 5})
    assert %{x: 0, y: 5, facing: :n, nodes: nodes} == pos
  end

  test "update position facing west go left", context do
    pos = Day01.update_position(%{context[:state] | facing: :w}, "L5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 0, y: -1})
    |> MapSet.put(%{x: 0, y: -2})
    |> MapSet.put(%{x: 0, y: -3})
    |> MapSet.put(%{x: 0, y: -4})
    |> MapSet.put(%{x: 0, y: -5})
    assert %{x: 0, y: -5, facing: :s, nodes: nodes} == pos
  end

  test "update position facing east go right", context do
    pos = Day01.update_position(%{context[:state] | facing: :e}, "R5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 0, y: -1})
    |> MapSet.put(%{x: 0, y: -2})
    |> MapSet.put(%{x: 0, y: -3})
    |> MapSet.put(%{x: 0, y: -4})
    |> MapSet.put(%{x: 0, y: -5})
    assert %{x: 0, y: -5, facing: :s, nodes: nodes} == pos
  end

  test "update position facing east go left", context do
    pos = Day01.update_position(%{context[:state] | facing: :e}, "L5")
    nodes = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 0, y: 1})
    |> MapSet.put(%{x: 0, y: 2})
    |> MapSet.put(%{x: 0, y: 3})
    |> MapSet.put(%{x: 0, y: 4})
    |> MapSet.put(%{x: 0, y: 5})
    assert %{x: 0, y: 5, facing: :n, nodes: nodes} == pos
  end

  test "find path" do
    assert 4 == Day01.find_pos("R8, R4, R4, R8")
  end

  test "visit nodes" do
    nodes = Day01.visit_nodes(%{x: 0, y: 0, nodes: mapset}, :x, 2)
    expected = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 1, y: 0})
    |> MapSet.put(%{x: 2, y: 0})
    assert nodes == expected
  end
  test "visit nodes 2" do
    nodes = Day01.visit_nodes(%{x: 0, y: 0, nodes: mapset}, :x, -2)
        expected = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: -1, y: 0})
    |> MapSet.put(%{x: -2, y: 0})
    assert nodes == expected
  end
  test "visit nodes 3" do
    nodes = Day01.visit_nodes(%{x: 0, y: 0, nodes: mapset}, :y, 2)
    expected = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 0, y: 1})
    |> MapSet.put(%{x: 0, y: 2})
    assert nodes == expected
  end
  test "visit nodes 4" do
    nodes = Day01.visit_nodes(%{x: 0, y: 0, nodes: mapset}, :y, -2)
    expected = MapSet.new
    |> MapSet.put(%{x: 0, y: 0})
    |> MapSet.put(%{x: 0, y: -1})
    |> MapSet.put(%{x: 0, y: -2})
    assert nodes == expected
  end

  test "solve" do
    Day01.part1
#    Day01.part2
  end

  defp mapset do
    MapSet.put(MapSet.new, %{x: 0, y: 0})
  end
end
