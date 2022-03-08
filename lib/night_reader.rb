require_relative '../lib/braille_filereader'

filereader = BrailleFileReader.new(ARGV[0])
filereader.create_new_english_file(ARGV[1])
character_count = filereader.count_characters(ARGV[0])
puts "Created '#{ARGV[1]}' containing #{character_count} characters"
