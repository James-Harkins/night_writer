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
  end

  describe '#read' do
    it 'can create a readable File object with the filename attribute' do
      expect(@filereader.read(@filereader.filename)).to be_a(String)
    end
  end

  describe '#count_characters' do
    it 'can count the characters of the File object' do
      expect(@filereader.count_characters(@filereader.filename)).to eq(56)
    end
  end

  describe '#create_new_file' do
    it 'can create a new file' do
      expect(@filereader.create_new_file("braille.txt")).to be_a(File)
    end
  end

  describe '#convert_to_braille' do
    it 'can read text and convert it to braille' do
      expect(@filereader.convert_to_braille(text)).to eq(Array)
    end
  end
end
