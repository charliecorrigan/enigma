require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys_generator'

class TestKeysGenerator < Minitest::Test
  def test_existence_of_keys_generator_class
    keys = KeysGenerator.new
    assert_instance_of KeysGenerator, keys
  end
end
