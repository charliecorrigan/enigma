require './lib/enigma'
require 'pry'

class CrackFromFile
  def initialize(input = nil, output = nil)
    @input = input || ARGV[0]
    @output = output || ARGV[1]
    create_and_write_cracked_file
  end

  def open_and_save_file_contents
    file_contents = File.open(@input, "r").read
    file_contents
  end

  def crack_file_contents
    original_file_contents = open_and_save_file_contents
    enigma = Enigma.new
    enigma.crack(original_file_contents)
  end

  def create_and_write_cracked_file
    contents = crack_file_contents
    cracked_file = File.open(@output, "w")
    cracked_file.write(contents)
    cracked_file.close
  end
end

