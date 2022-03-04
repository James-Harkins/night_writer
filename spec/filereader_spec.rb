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

    it 'can create a readable File object with the filename attribute' do
      expect(@filereader.read(@filereader.filename)).to be_a(String)
    end

    it 'can count the characters of the File object' do
      expect(@filereader.count_characters(@filereader.filename))).to eq(56)
    end
  end
end
