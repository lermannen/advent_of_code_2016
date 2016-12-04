defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "parses input" do
    expected = %{name: "aaaaa-bbb-z-y-x", sector: 123, checksum: "abxyz"}
    assert expected == Day04.transform("aaaaa-bbb-z-y-x-123[abxyz]")
  end

  test "real_room?" do
    data = Day04.transform("aaaaa-bbb-z-y-x-123[abxyz]")
    assert Day04.real_room?(data)
  end

  test "decrypt" do
    result = Day04.decrypt(%{name: "qzmt-zixmtkozy-ivhz", sector: 343})
    assert "very encrypted name" == result
  end

  test "solve" do
    {:ok, file} = File.read("lib/day04.input")
    part1 = Day04.solve(String.trim(file))
    Day04.solve2(String.trim(file))
    IO.puts "Sum of sectors: #{part1}"
  end
end
