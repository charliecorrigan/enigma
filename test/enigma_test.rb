require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class TestEnigma < Minitest::Test
  def test_existence_of_enigma_class
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end
end
