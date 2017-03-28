require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt_from_file'

class DecryptFromFileTest < Minitest::Test
  def test_existence_of_class
    decrypt = DecryptFromFile.new("./test/fixtures/encrypted.txt", "./test/fixtures/decrypted.txt", "12345", 260317)
    assert_instance_of DecryptFromFile, decrypt
  end

  def test_decrypted_file_created_by_decrypt
    decrypt = DecryptFromFile.new("./test/fixtures/encrypted.txt", "./test/fixtures/decrypted.txt", "12345", 260317)
    decrypted_file = File.open("./test/fixtures/decrypted.txt", "r")
    assert_equal "nick 1", decrypted_file.read
  end
end
