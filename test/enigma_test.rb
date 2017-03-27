require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class TestEnigma < Minitest::Test
  def test_existence_of_enigma_class
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_encrypt_method_return_class
    enigma = Enigma.new
    assert_equal String, enigma.encrypt("nick 1", "12345", 260317).class
  end
end
