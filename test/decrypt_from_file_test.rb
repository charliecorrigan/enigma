require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt_from_file'

class DecryptFromFileTest < Minitest::Test
  def test_existence_of_class
    decrypt = DecryptFromFile.new
    assert_instance_of DecryptFromFile, decrypt
  end
end
