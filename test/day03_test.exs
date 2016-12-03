defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "2 3 10 is false" do
    assert 0 == Day03.solve("2 3 10")
  end

  test "One good and one bad" do
    assert 1 == Day03.solve("5 10 25\n1 1 1")
  end

  test "solve" do
    {:ok, file} = File.read("lib/day03.input")
    part1 = Day03.solve(file)
    part2 = Day03.solve(file, &Day03.columns/1)
    IO.puts "Number of valid triangles: #{part1} and #{part2}"
  end
end
