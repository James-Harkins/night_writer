require_relative '../lib/dictionary'
require 'pry'

class EnglishFileReader

  include Dictionary

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read(filename)
    file = File.open(filename, "r")
    text = file.read
    file.close
    text.gsub("\n", " ")
  end

  def count_characters(filename)
    text = read(filename)
    text.length
  end

  def create_new_braille_file(new_filename)
    new_file = File.open(new_filename, "w")
    create_braille_message.each {|line| new_file.write(line)}
    new_file.close
    new_file
  end

  def convert_to_braille(text)
    rows = [[], [], []]
    text.each do |character|
      rows[0] << english_to_braille(character)[0].join
      rows[1] << english_to_braille(character)[1].join
      rows[2] << english_to_braille(character)[2].join
    end
    rows
  end

  def convert_to_lines(text)
    lines = []
    text = text.split("")
    formatted_text = text.map do |character|
      if capital_letters.include?(character)
        character.downcase.prepend("^")
      else
        character
      end
    end.join
    formatted_text = formatted_text.split("")
    formatted_text.each_slice(40) {|line| lines << line}
    lines
  end

  def create_braille_message
    braille_lines = []
    convert_to_lines(read(@filename)).each do |line|
      convert_to_braille(line).each do |braille_character|
        braille_lines << braille_character.join + "\n"
      end
    end
    braille_lines
  end
end
