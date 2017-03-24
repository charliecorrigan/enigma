require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class TestKeyGenerator < Minitest::Test
  def test_existence_of_key_generator_class
    key_generator = KeyGenerator.new
    assert_equal true, key_generator = !nil
  end
end



