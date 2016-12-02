defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "solve" do
    {:ok, file} = File.read("lib/day02.input")
    part1 = Day02.code(file, &Day02.digit/2)
    part2 = Day02.code(file, &Day02.digit2/2)
    IO.puts "Code for part one: #{part1}, code for part two: #{part2}"
  end
end
