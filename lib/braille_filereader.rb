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
    consolidated_lines = []
    top_row_number = 3
    middle_row_number = 4
    bottom_row_number = 5
    text = read(@filename)
    consolidated_lines << text[0]
    consolidated_lines << text[1]
    consolidated_lines << text[2]
    while text[top_row_number]
      consolidated_lines[0] << text[top_row_number]
      top_row_number += 3
    end
    while text[middle_row_number]
      consolidated_lines[1] << text[middle_row_number]
      middle_row_number += 3
    end
    while text[bottom_row_number]
      consolidated_lines[2] << text[bottom_row_number]
      bottom_row_number += 3
    end
    consolidated_lines
  end
end
