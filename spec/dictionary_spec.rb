require_relative '../lib/english_filereader'
require_relative '../lib/dictionary'
require 'pry'

RSpec.describe Dictionary do

  before(:each) do
    @filereader = EnglishFileReader.new("./message.txt")
  end

  describe '#initialze' do
    it 'is initialized with an alphabet to braille hash' do
      expect(@filereader.alphabet).to be_a(Hash)
      expect(@filereader.alphabet["a"]).to be_a(Array)
      expect(@filereader.alphabet["a"]).to eq([["0", "."], [".", "."], [".", "."]])
      expect(@filereader.alphabet.all? {|key, value| value.length == 3}).to be(true)
    end

    it 'has unique keys' do
      expected = (@filereader.alphabet.keys.count == @filereader.alphabet.keys.uniq.count)
      expect(expected).to be(true)
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
  end

  describe '#braille_to_english' do
    it 'can convert braille to english' do
      expect(@filereader.braille_to_english([["0", "."], [".", "."], ["0", "."]])).to eq("k")
    end

    it 'supports capitalization' do
      braille = [[".", "."], [".", "."], [".", "0"], ["0", "."], [".", "."], [".", "."]]
      expect(@filereader.english_to_braille(braille)).to eq("A")
    end
  end
end
