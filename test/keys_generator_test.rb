require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys_generator'

class TestKeysGenerator < Minitest::Test
  def test_existence_of_keys_generator_class
    keys_generator = KeysGenerator.new(nil, nil)
    assert_instance_of KeysGenerator, keys
  end

  def test_returns_keys
    keys_generator = KeysGenerator.new(nil, nil)
    keys = keys_generator.generate_keys
    assert_equal Array, keys.class
    assert_equal 4, keys.length
    assert_equal Fixnum, keys.first.class
    
    keys_generator = KeysGenerator.new("12345", nil)
    keys = keys_generator.generate_keys
    assert_equal Array, keys.class
    assert_equal 4, keys.length
    assert_equal Fixnum, keys.first.class

    keys_generator = KeysGenerator.new("12345", 260317)
    keys = keys_generator.generate_keys
    assert_equal Array, keys.class
    assert_equal 4, keys.length
    assert_equal Fixnum, keys.first.class

    keys_generator = KeysGenerator.new(nil, 260317)
    keys = keys_generator.generate_keys
    assert_equal Array, keys.class
    assert_equal 4, keys.length
    assert_equal Fixnum, keys.first.class
  end
end
