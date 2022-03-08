require_relative "../lib/english_filereader"
require 'pry'
require 'simplecov'
SimpleCov.start

RSpec.describe EnglishFileReader do

  before(:each) do
    @filereader = EnglishFileReader.new("./message.txt")
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
      expect(@filereader.create_new_braille_file("braille.txt")).to be_a(File)
    end
  end

  describe '#convert_to_braille' do
    it 'can read text and convert it to braille' do
      expect(@filereader.convert_to_braille(["a"])).to be_a(Array)
      expect(@filereader.convert_to_braille(["a"])[0]).to be_a(Array)
      expect(@filereader.convert_to_braille(["a"]).count).to eq(3)
    end
  end

  describe '#format_text_for_capitalization' do
    it 'can format text to prepare it for conversion to lines' do
      text = "We will always be so much more human than we wish to be"
      expect(@filereader.format_text_for_capitalization(text).count).to eq(56)
      expect(@filereader.format_text_for_capitalization(text)[0]).to eq("^")
    end
  end

  describe '#convert_to_lines' do
    it 'can create correctly nested arrays for inputs with more than 40 characters' do
      text = "We will always be so much more human than we wish to be"
      expect(@filereader.convert_to_lines(text).count).to eq(2)
      expect(@filereader.convert_to_lines(text)[0].count).to eq(40)
      expect(@filereader.convert_to_lines(text)[1].count).to eq(16)
    end
  end

  describe '#create_braille_message' do
    it 'can create a writable braille message to be written to the new file' do
      expect(@filereader.create_braille_message).to be_a(Array)
      expect(@filereader.create_braille_message.count).to eq(6)
      expect(@filereader.create_braille_message[0].length).to eq(81)
    end
  end
end
