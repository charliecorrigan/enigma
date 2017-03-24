require 'minitest/autorun'
require 'minitest/pride'

class TestKeyGenerator < Minitest::Test
  def test_existence_of_key_generator_class
    key_generator = KeyGenerator.new
    refute_nil key_generator
  end
end

