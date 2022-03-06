require_relative '../lib/dictionary'
require 'pry'

class EnglishFileReader

  attr_reader :filename, :dictionary

  def initialize(filename)
    @filename = filename
    @dictionary = Dictionary.new
  end

  def read_english(filename)
    file = File.open(filename, "r")
    text = file.read
    file.close
    text.delete("\n")
  end

  def count_characters(filename)
    text = read_english(filename)
    text.length
  end

  def create_new_braille_file(new_filename)
    new_file = File.open(new_filename, "w")
    convert_to_lines(read_english(@filename)).each do |line|
      convert_to_braille(line).each do |braille_character|
        new_file.write(braille_character.join + "\n")
      end
    end
    new_file.close
    new_file
  end

  def convert_to_braille(text)
    rows = [[], [], []]
    text.each do |character|
      rows[0] << @dictionary.english_to_braille(character)[0].join
      rows[1] << @dictionary.english_to_braille(character)[1].join
      rows[2] << @dictionary.english_to_braille(character)[2].join
    end
    rows
  end

  def convert_to_lines(text)
    lines = []
    text = text.split("")
    text.each_slice(40) {|line| lines << line}
    lines
  end

  # def convert_braille_string_to_characters(string)
  #
  # end
end
