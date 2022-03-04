require_relative '../lib/filereader'
require 'pry'

filereader = FileReader.new(ARGV[0])
filereader.create_new_file(ARGV[1])
character_count = filereader.count_characters(ARGV[0])
puts "Created '#{ARGV[1]}' containing #{character_count} characters"
