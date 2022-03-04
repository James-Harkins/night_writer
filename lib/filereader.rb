require 'dictionary'
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
    new_file.write(read(@filename))
    new_file.close
    new_file
  end

  def convert_to_braille
    text = read(@filename)
    @dictionary.english_to_braille(text)
  end
end
