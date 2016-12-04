defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "parses input" do
    expected = %{name: "aaaaabbbzyx", sector: "123", checksum: "abxyz"}
    assert expected == Day04.transform("aaaaa-bbb-z-y-x-123[abxyz]")
  end

  test "real_room?" do
    data = Day04.transform("aaaaa-bbb-z-y-x-123[abxyz]")
    assert Day04.real_room?(data)
  end

  test "solve" do
    {:ok, file} = File.read("lib/day04.input")
    part1 = Day04.solve(String.trim(file))
    IO.puts "Sum of sectors: #{part1}"
  end
end
