defmodule Day02 do
  # 1 2 3
  # 4 5 6
  # 7 8 9

  def digit(1, "U"), do: 1
  def digit(1, "D"), do: 4
  def digit(1, "R"), do: 2
  def digit(1, "L"), do: 1
  def digit(2, "U"), do: 2
  def digit(2, "D"), do: 5
  def digit(2, "R"), do: 3
  def digit(2, "L"), do: 1
  def digit(3, "U"), do: 3
  def digit(3, "D"), do: 6
  def digit(3, "R"), do: 3
  def digit(3, "L"), do: 2
  def digit(4, "U"), do: 1
  def digit(4, "D"), do: 7
  def digit(4, "R"), do: 5
  def digit(4, "L"), do: 4
  def digit(5, "U"), do: 2
  def digit(5, "D"), do: 8
  def digit(5, "R"), do: 6
  def digit(5, "L"), do: 4
  def digit(6, "U"), do: 3
  def digit(6, "D"), do: 9
  def digit(6, "R"), do: 6
  def digit(6, "L"), do: 5
  def digit(7, "U"), do: 4
  def digit(7, "D"), do: 7
  def digit(7, "R"), do: 8
  def digit(7, "L"), do: 7
  def digit(8, "U"), do: 5
  def digit(8, "D"), do: 8
  def digit(8, "R"), do: 9
  def digit(8, "L"), do: 7
  def digit(9, "U"), do: 6
  def digit(9, "D"), do: 9
  def digit(9, "R"), do: 9
  def digit(9, "L"), do: 8


 #      1
 #    2 3 4
 #  5 6 7 8 9
 #    A B C
 #      D

  def digit2("1", "U"), do: "1"
  def digit2("1", "D"), do: "3"
  def digit2("1", "R"), do: "1"
  def digit2("1", "L"), do: "1"

  def digit2("2", "U"), do: "2"
  def digit2("2", "D"), do: "6"
  def digit2("2", "R"), do: "3"
  def digit2("2", "L"), do: "2"

  def digit2("3", "U"), do: "1"
  def digit2("3", "D"), do: "7"
  def digit2("3", "R"), do: "4"
  def digit2("3", "L"), do: "2"

  def digit2("4", "U"), do: "4"
  def digit2("4", "D"), do: "8"
  def digit2("4", "R"), do: "4"
  def digit2("4", "L"), do: "3"

  def digit2("5", "U"), do: "5"
  def digit2("5", "D"), do: "5"
  def digit2("5", "R"), do: "6"
  def digit2("5", "L"), do: "5"

  def digit2("6", "U"), do: "2"
  def digit2("6", "D"), do: "A"
  def digit2("6", "R"), do: "7"
  def digit2("6", "L"), do: "5"

  def digit2("7", "U"), do: "3"
  def digit2("7", "D"), do: "B"
  def digit2("7", "R"), do: "8"
  def digit2("7", "L"), do: "6"

  def digit2("8", "U"), do: "4"
  def digit2("8", "D"), do: "C"
  def digit2("8", "R"), do: "9"
  def digit2("8", "L"), do: "7"

  def digit2("9", "U"), do: "9"
  def digit2("9", "D"), do: "9"
  def digit2("9", "R"), do: "9"
  def digit2("9", "L"), do: "8"

  def digit2("A", "U"), do: "6"
  def digit2("A", "D"), do: "A"
  def digit2("A", "R"), do: "B"
  def digit2("A", "L"), do: "A"

  def digit2("B", "U"), do: "7"
  def digit2("B", "D"), do: "D"
  def digit2("B", "R"), do: "C"
  def digit2("B", "L"), do: "A"

  def digit2("C", "U"), do: "8"
  def digit2("C", "D"), do: "C"
  def digit2("C", "R"), do: "C"
  def digit2("C", "L"), do: "B"

  def digit2("D", "U"), do: "B"
  def digit2("D", "D"), do: "D"
  def digit2("D", "R"), do: "D"
  def digit2("D", "L"), do: "D"

  def code(instructions) do
    ins = String.split(instructions)
    Enum.reduce(ins, 5, fn(x, acc) -> find_digit(x, acc) end)
    IO.puts "----"
  end

  defp find_digit(instruction, init) do
    x = Enum.reduce(String.graphemes(instruction), init, fn(x, acc) -> digit(acc, x) end)
    IO.puts x
    x
  end

  def code2(instructions) do
    ins = String.split(instructions)
    Enum.reduce(ins, "5", fn(x, acc) -> find_digit2(x, acc) end)
    IO.puts "----"
  end

  defp find_digit2(instruction, init) do
    x = Enum.reduce(String.graphemes(instruction), init, fn(x, acc) -> digit2(acc, x) end)
    IO.puts x
    x
  end
end
