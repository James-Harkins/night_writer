require_relative '../lib/braille_filereader'
require_relative '../lib/english_filereader'

braille_filereader = BrailleFileReader.new(ARGV[0])
braille_filereader.create_new_english_file(ARGV[1])
english_filereader = EnglishFileReader.new(ARGV[1])
character_count = english_filereader.count_characters(ARGV[1])
puts "Created '#{ARGV[1]}' containing #{character_count} characters"
