defmodule Day05Test do
  use ExUnit.Case
  doctest Day05

  test "find hash" do
    Day05.find_hash("abbhdwsy")
  end

  # test "solve" do
  #   {:ok, file} = File.read("lib/day05.input")
  #   part1 = Day05.solve(String.trim(file))
  #   Day05.solve2(String.trim(file))
  #   IO.puts "Sum of sectors: #{part1}"
  # end
end
