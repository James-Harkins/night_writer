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
    it 'can create a readable array of lines of partial braille characters with the filename attribute' do
      expect(@filereader.read(@filereader.filename)).to be_a(Array)
    end
  end

  describe '#count_characters' do
    it 'can count the characters of the File object' do
      expect(@filereader.count_characters(@filereader.filename)).to eq(55)
    end
  end

  describe '#consolidate_lines' do
    it 'can take all lines of braille and consolidate into 3 total lines for one long array of braille' do
      expect(@filereader.consolidate_lines).to be_a(Array)
      expect(@filereader.consolidate_lines.count).to eq(3)
    end
  end

  describe '#convert_to_english' do
    it 'can convert consolidated_lines to of english characters' do
      expect(@filereader.convert_to_english).to be_a(Array)
      expect(@filereader.convert_to_english[0]).to be_a(String)
    end
  end
end
