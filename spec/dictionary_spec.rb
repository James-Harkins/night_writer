require_relative '../lib/dictionary'
require 'pry'

RSpec.describe Dictionary do

  before(:each) do
    dictionary = Dictionary.new
  end

  describe '#initialze' do
    it 'is initialized with an alphabet to braille hash' do
      expect(@dictionary.alphabet).to be_a(Hash)
      expect(@dictionary.alphabet["a"]).to be_a(Matrix)
    end
  end
end
