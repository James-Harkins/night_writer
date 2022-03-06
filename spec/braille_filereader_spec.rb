require_relative "../lib/braille_filereader"
require 'pry'
require 'simplecov'
SimpleCov.start

RSpec.describe BrailleFileReader do

  before(:each) do
    @filereader = BrailleFileReader.new("./braille.txt")
  end

  describe '#initialize' do
    it 'is initialized with a filename' do
      expect(@filereader.filename).to eq("./braille.txt")
    end

    it 'is initialized with a dictionary' do
      expect(@filereader.dictionary).to be_a(Dictionary)
      expect(@filereader.dictionary.alphabet["a"]).to be_a(Array)
    end
  end

  describe '#read' do
    it 'can create a readable File object with the filename attribute' do
      expect(@filereader.read(@filereader.filename)).to be_a(String)
    end
  end

  describe '#count_characters' do
    it 'can count the characters of the File object' do
      expect(@filereader.count_characters(@filereader.filename)).to eq(55)
    end
  end
end
