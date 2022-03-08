require_relative '../lib/english_filereader'
require_relative '../lib/dictionary'
require 'pry'

RSpec.describe Dictionary do

  before(:each) do
    @filereader = EnglishFileReader.new("./message.txt")
  end

  describe '#alphabet' do
    it 'has a hash of english letter keys and braille character values' do
      expected = @filereader.alphabet.keys.length == @filereader.alphabet.keys.uniq.length
      expect(expected).to be(true)
    end
  end

  describe '#capital_letters' do
    it 'has an array of capital letters to check against' do
      expect(@filereader.capital_letters.count).to eq(26)
    end
  end

  describe '#numbers' do
    it 'has an hash of digit keys with letter values to check against' do
      expect(@filereader.numbers.keys.count).to eq(9)
    end
  end

  describe '#english_to_braille' do
    it 'can convert letters to braille' do
      expect(@filereader.english_to_braille("a")).to eq([["0", "."], [".", "."], [".", "."]])
    end

    it 'supports capitalization' do
      expected = [[".", "."], [".", "."], [".", "0"], ["0", "."], [".", "."], [".", "."]]
      expect(@filereader.english_to_braille("A")).to eq(expected)
    end

    it 'supports numbers' do
      expected = [[".", "0"], [".", "0"], ["0", "0"], ["0", "."], [".", "."], [".", "."]]
      expect(@filereader.english_to_braille("1")).to eq(expected)
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

    it 'supports capitalization' do
      braille = [[".", "0"], [".", "0"], ["0", "0"], ["0", "."], [".", "."], [".", "."]]
      expect(@filereader.braille_to_english(braille)).to eq("1")
    end
  end
end
