require_relative '../lib/dictionary'
require 'pry'

class FileReader

  attr_reader :filename, :dictionary

  def initialize(filename)
    @filename = filename
    @dictionary = Dictionary.new
  end

  def read(filename)
    file = File.open(filename, "r")
    text = file.read
    file.close
    text.delete("\n")
  end

  def count_characters(filename)
    text = read(filename)
    text.length
  end

  def create_new_file(new_filename)
    new_file = File.open(new_filename, "w")
    new_file.write(convert_to_braille[0])
    new_file.write(convert_to_braille[1])
    new_file.write(convert_to_braille[2])
    new_file.close
    new_file
  end

  def convert_to_braille
    text = read(@filename)
    row1 = @dictionary.english_to_braille(text)[0].join + "\n"
    row2 = @dictionary.english_to_braille(text)[1].join + "\n"
    row3 = @dictionary.english_to_braille(text)[2].join + "\n"
    [row1, row2, row3]
  end
end
