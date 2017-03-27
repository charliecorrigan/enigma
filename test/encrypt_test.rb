require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'


#message.txt should live in fixtures/ which lives in test/
class TestEncrypt < Minitest::Test
  def test_existence_of_class
    encrypt = Encrypt.new("./test/fixtures/nick_1.txt", "encrypted_nick.txt")
    assert_instance_of Encrypt, encrypt
  end

  def test_encrypted_file_created_by_encrypt
    encrypt = Encrypt.new("./test/fixtures/nick_1.txt", "encrypted_nick.txt")
    encryption_file = File.open("encrypted_nick.txt", "r")
    encryption_check = encryption_file.read
    binding.pry
    assert_equal "z9fzjp", encryption_check
  end

end