require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt_from_file'

class EncryptFromFileTest < Minitest::Test
  def test_existence_of_class
    encrypt = EncryptFromFile.new("./test/fixtures/nick_1.txt", "./test/fixtures/encrypted_nick.txt")
    assert_instance_of EncryptFromFile, encrypt
  end

  def test_encrypted_file_created_by_encrypt
    encrypt = EncryptFromFile.new("./test/fixtures/nick_1.txt", "./test/fixtures/encrypted_nick.txt")
    encrypted_file = File.open("./test/fixtures/encrypted_nick.txt")
    assert_equal 6, encrypted_file.read.length
    assert_equal String, encrypted_file.read.class
  end
end
