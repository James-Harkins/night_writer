require 'pry'

module Dictionary

  def alphabet
    {
      "a" => [["0", "."], [".", "."], [".", "."]],
      "b" => [["0", "."], ["0", "."], [".", "."]],
      "c" => [["0", "0"], [".", "."], [".", "."]],
      "d" => [["0", "0"], [".", "0"], [".", "."]],
      "e" => [["0", "."], [".", "0"], [".", "."]],
      "f" => [["0", "0"], ["0", "."], [".", "."]],
      "g" => [["0", "0"], ["0", "0"], [".", "."]],
      "h" => [["0", "."], ["0", "0"], [".", "."]],
      "i" => [[".", "0"], ["0", "."], [".", "."]],
      "j" => [[".", "0"], ["0", "0"], [".", "."]],
      "k" => [["0", "."], [".", "."], ["0", "."]],
      "l" => [["0", "."], ["0", "."], ["0", "."]],
      "m" => [["0", "0"], [".", "."], ["0", "."]],
      "n" => [["0", "0"], [".", "0"], ["0", "."]],
      "o" => [["0", "."], [".", "0"], ["0", "."]],
      "p" => [["0", "0"], ["0", "."], ["0", "."]],
      "q" => [["0", "0"], ["0", "0"], ["0", "."]],
      "r" => [["0", "."], ["0", "0"], ["0", "."]],
      "s" => [[".", "0"], ["0", "."], ["0", "."]],
      "t" => [[".", "0"], ["0", "0"], ["0", "."]],
      "u" => [["0", "."], [".", "."], ["0", "0"]],
      "v" => [["0", "."], ["0", "."], ["0", "0"]],
      "w" => [[".", "0"], ["0", "0"], [".", "0"]],
      "x" => [["0", "0"], [".", "."], ["0", "0"]],
      "y" => [["0", "0"], [".", "0"], ["0", "0"]],
      "z" => [["0", "."], [".", "0"], ["0", "0"]],
      " " => [[".", "."], [".", "."], [".", "."]],
      "^" => [[".", "."], [".", "."], [".", "0"]],
      "#" => [[".", "0"], [".", "0"], ["0", "0"]]
    }
  end

  def capital_letters
    ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
    "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  end

  def numbers
    {
      "1" => "a",
      "2" => "b",
      "3" => "c",
      "4" => "d",
      "5" => "e",
      "6" => "f",
      "7" => "g",
      "8" => "h",
      "9" => "i"
    }
  end

  def english_to_braille(character)
    if capital_letters.include?(character)
      capital_letter = ["^", character.downcase]
      capital_letter.flat_map {|letter| alphabet[letter]}
    elsif numbers.keys.include?(character)
      number = ["#", numbers[character].downcase]
      number.flat_map {|number| alphabet[number]}
    else
      alphabet[character]
    end
  end

  def braille_to_english(character)
    if character[0] == [".", "."] && character[1] == [".", "."] && character[2] ==  [".", "0"]
      3.times {character.shift}
      alphabet.key(character).upcase
    elsif character[0] == [".", "0"] && character[1] == [".", "0"] && character[2] ==  ["0", "0"]
      3.times {character.shift}
      numbers.key(alphabet.key(character))
    else
      alphabet.key(character)
    end
  end

end
