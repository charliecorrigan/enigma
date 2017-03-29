require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack_from_file'

class CrackFromFileTest < Minitest::Test
  def test_existence_of_class
    crack = CrackFromFile.new("./test/fixtures/encrypted_to_be_cracked.txt", "./test/fixtures/cracked.txt")
    assert_instance_of CrackFromFile, crack
  end

  def test_cracked_file_created_by_crack
    crack = CrackFromFile.new("./test/fixtures/encrypted_to_be_cracked.txt", "./test/fixtures/cracked.txt")
    cracked_file = File.open("./test/fixtures/cracked.txt", "r")
    assert_equal "hello world..end..", cracked_file.read
  end
end
