require './lib/enigma'
require 'pry'

class DecryptFromFile
  def initialize(input = nil, output = nil, key = nil, date = nil)
    @input = input || ARGV[0]
    @output = output || ARGV[1]
    @key = key || ARGV[2]
    @date = date || ARGV[3]
    create_and_write_decrypted_file
  end

  def open_and_save_file_contents
    file_contents = File.open(@input, "r").read
    file_contents
  end

  def decrypt_file_contents
    original_file_contents = open_and_save_file_contents
    enigma = Enigma.new
    enigma.decrypt(original_file_contents, @key, @date)
  end

  def create_and_write_decrypted_file
    contents = decrypt_file_contents
    decrypted_file = File.open(@output, "w")
    decrypted_file.write(contents)
    decrypted_file.close
  end
end
