require 'pry'

class FileReader

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read(filename)
    file = File.open(filename, "r")
    text = file.read
    file.close
    text
  end

  def count_characters(filename)
    text = read(filename)
    text.length
  end

  def create_new_file(new_filename)
    new_file = File.open(new_filename, "w")
    new_file.write(read(@filename))
    new_file.close
    new_file
  end

end
