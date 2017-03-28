require './lib/enigma'
class EncryptFromFile
  def initialize(input = nil, output = nil)
    @input = input || ARGV[0]
    @output = output || ARGV[1]
    create_and_write_encrypted_file
  end

  def open_and_save_file_contents
    file_contents = File.open(@input, 'r').read
    file_contents
  end

  def encrypt_file_contents
    original_file_contents = open_and_save_file_contents
    enigma = Enigma.new
    enigma.encrypt(original_file_contents)
  end

  def create_and_write_encrypted_file
    contents = encrypt_file_contents
    encrypted_file = File.open(@output, "w")
    encrypted_file.write(contents)
    encrypted_file.close
  end
end
