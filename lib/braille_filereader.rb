require_relative '../lib/dictionary'
require 'pry'

class BrailleFileReader

  include Dictionary

  attr_reader :filename

  def initialize(filename)
    @filename = filename
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

  def braille_character_creator(braille_lines)
    braille_character = []
    braille_lines.each {|line| braille_character << line.slice!(0..1).split("")}
    braille_character
  end

  def convert_to_braille_characters
    lines = consolidate_lines
    braille_characters = []
    while lines[0][0]
      if lines[0][0..1] == ".." && lines[1][0..1] == ".." && lines[2][0..1] == ".0"
        braille_character = []
        braille_character << lines[0].slice!(0..1).split("")
        braille_character << lines[1].slice!(0..1).split("")
        braille_character << lines[2].slice!(0..1).split("")
        braille_character << lines[0].slice!(0..1).split("")
        braille_character << lines[1].slice!(0..1).split("")
        braille_character << lines[2].slice!(0..1).split("")
        braille_characters << braille_character
        braille_character = []
      else
        braille_character = []
        braille_character << lines[0].slice!(0..1).split("")
        braille_character << lines[1].slice!(0..1).split("")
        braille_character << lines[2].slice!(0..1).split("")
        braille_characters << braille_character
        braille_character = []
      end
    end
    braille_characters
  end

  def convert_to_english
    convert_to_braille_characters.map do |braille_character|
      braille_to_english(braille_character)
    end
  end

  def convert_to_lines
    lines = []
    convert_to_english.each_slice(80) {|line| lines << line}
    lines.map {|line| line.join + "\n"}
  end

  def create_new_english_file(new_filename)
    new_file = File.open(new_filename, "w")
    convert_to_lines.each {|line| new_file.write(line)}
    new_file.close
    new_file
  end
end
