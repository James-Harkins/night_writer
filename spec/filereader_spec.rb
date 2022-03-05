require_relative "../lib/filereader"
require 'pry'
require 'simplecov'
SimpleCov.start

RSpec.describe FileReader do

  before(:each) do
    @filereader = FileReader.new("./message.txt")
  end

  describe '#initialize' do
    it 'is initialized with a filename' do
      expect(@filereader.filename).to eq("./message.txt")
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
      expect(@filereader.count_characters(@filereader.filename)).to eq(2)
    end
  end

  describe '#create_new_file' do
    it 'can create a new file' do
      expect(@filereader.create_new_file("braille.txt")).to be_a(File)
    end
  end

  describe '#convert_to_braille' do
    it 'can read text and convert it to braille' do
      expect(@filereader.convert_to_braille).to be_a(Array)
      expect(@filereader.convert_to_braille[0]).to be_a(Array)
      expect(@filereader.convert_to_braille.count).to eq(3)
    end
  end

  describe '#convert_to_braille_40' do
    it 'can create correctly nested arrays for inputs with more than 40 characters' do
      text = "we will always be so much more human than we wish to be"
      expect(@filereader.convert_to_braille_40(text).count).to eq(6)
      expect(@filereader.convert_to_braille_40(text)[0]).to eq(40)
      expect(@filereader.convert_to_braille_40(text)[1]).to eq(40)
      expect(@filereader.convert_to_braille_40(text)[2]).to eq(40)
      expect(@filereader.convert_to_braille_40(text)[2]).to eq(15)
      expect(@filereader.convert_to_braille_40(text)[2]).to eq(15)
      expect(@filereader.convert_to_braille_40(text)[2]).to eq(15)
    end
  end
end
