require_relative '../lib/dictionary'
require 'pry'

RSpec.describe Dictionary do

  before(:each) do
    @dictionary = Dictionary.new
  end

  describe '#initialze' do
    it 'is initialized with an alphabet to braille hash' do
      expect(@dictionary.alphabet).to be_a(Hash)
      expect(@dictionary.alphabet["a"]).to be_a(Array)
      expect(@dictionary.alphabet["a"]).to eq([[0, "."], [".", "."], [".", "."]])
      expect(@dictionary.alphabet.all? {|key, value| value.length == 3}).to be(true)
    end

    it 'has unique keys' do
      expected = (@dictionary.alphabet.keys.count == @dictionary.alphabet.keys.uniq.count)
      expect(expected).to be(true)
    end

    it 'can convert letters to braille' do
      expect(@dictionary.english_to_braille("a")).to eq([[0, "."], [".", "."], [".", "."]])
  end
end
