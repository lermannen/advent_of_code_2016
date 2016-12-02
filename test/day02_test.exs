defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  setup do
    {:ok, [state: %{x: 0, y: 0, facing: :n,
                    nodes: MapSet.put(MapSet.new, %{x: 0, y: 0})}]}
  end

  test "update position facing north go right", context do
    instructions = "ULL
    RRDDD
    LURDL
    UUUUD"
    assert "1985" == Day02.code(instructions, &Day02.digit/2)
  end

  test "solve" do
    {:ok, file} = File.read("lib/day02.input")
    Day02.code(file, &Day02.digit/2)
    Day02.code(file, &Day02.digit2/2)
  end
end
