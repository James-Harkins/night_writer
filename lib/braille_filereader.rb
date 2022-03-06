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
    # consolidated_lines = []
    # top_row_number = 3
    # middle_row_number = 4
    # bottom_row_number = 5
    # text = read(@filename)
    # consolidated_lines << text[0]
    # consolidated_lines << text[1]
    # consolidated_lines << text[2]
    # while text[top_row_number] && text[middle_row_number] && text[bottom_row_number]
    #   consolidated_lines[0] << text[top_row_number]
    #   top_row_number += 3
    #   consolidated_lines[1] << text[middle_row_number]
    #   middle_row_number += 3
    #   consolidated_lines[2] << text[bottom_row_number]
    #   bottom_row_number += 3
    # end
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
    binding.pry
    braille_characters
  end
end
