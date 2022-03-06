require_relative '../lib/filereader'
require 'pry'

filereader = EnglishFileReader.new(ARGV[0])
character_count = filereader.count_characters(ARGV[0])
filereader.create_new_braille_file(ARGV[1])
puts "Created '#{ARGV[1]}' containing #{character_count} characters"
