require_relative '../lib/english_filereader'
require_relative '../lib/dictionary'
require 'pry'

RSpec.describe Dictionary do

  before(:each) do
    @filereader = EnglishFileReader.new("./message.txt")
  end

  describe '#english_to_braille' do
    it 'can convert letters to braille' do
      expect(@filereader.english_to_braille("a")).to eq([["0", "."], [".", "."], [".", "."]])
    end

    it 'supports capitalization' do
      expected = [[".", "."], [".", "."], [".", "0"], ["0", "."], [".", "."], [".", "."]]
      expect(@filereader.english_to_braille("A")).to eq(expected)
    end
  end

  describe '#braille_to_english' do
    it 'can convert braille to english' do
      expect(@filereader.braille_to_english([["0", "."], [".", "."], ["0", "."]])).to eq("k")
    end

    it 'supports capitalization' do
      braille = [[".", "."], [".", "."], [".", "0"], ["0", "."], [".", "."], [".", "."]]
      expect(@filereader.braille_to_english(braille)).to eq("A")
    end
  end
end
