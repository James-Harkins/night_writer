require_relative '../lib/dictionary'
require 'pry'

class BrailleFileReader

  attr_reader :filename, :dictionary

  def initialize(filename)
    @filename = filename
    @dictionary = Dictionary.new
  end

  def read(filename)
    file = File.open(filename, "r")
    text = file.readlines
    file.close
    text = text.map {|line| line.delete("\n")}
  end

  def count_characters(filename)
    text = read(filename)
    text.map {|line| line.length}.sum / 6
  end

  def consolidate_lines
    consolidated_lines = ["", "", ""]
    text = read(@filename)
    text.each_with_index {|line, index| consolidated_lines[index % 3] << line}
    consolidated_lines
  end

  def convert_to_braille_characters
    braille_characters = []
    column_1_counter = 0
    column_2_counter = 1
    while consolidate_lines[0][column_1_counter]
      braille_character = []
      braille_character << consolidate_lines[0][column_1_counter..column_2_counter].split("")
      braille_character << consolidate_lines[1][column_1_counter..column_2_counter].split("")
      braille_character << consolidate_lines[2][column_1_counter..column_2_counter].split("")
      braille_characters << braille_character
      braille_character = []
      column_1_counter += 2
      column_2_counter += 2
    end
    braille_characters
  end

  def convert_to_english
    convert_to_braille_characters.map do |braille_character|
      @dictionary.braille_to_english(braille_character)
    end
  end
end
