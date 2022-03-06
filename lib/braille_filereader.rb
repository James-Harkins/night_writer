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
    text = file.read.split("")
    file.close
    text
  end

  text.each_slice(character_count) {|line| lines << line}

  def count_characters(filename)
    text = read(filename)
    text.map {|line| line.length}.sum / 6
  end

end
