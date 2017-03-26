require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class TestKeyGenerator < Minitest::Test
  def test_existence_of_key_generator_class
    key_generator = KeyGenerator.new
    assert_equal true, key_generator = !nil
  end

  def test_generate_new_key_return_value
    key_generator = KeyGenerator.new
    assert_equal String, key_generator.generate_new_key.class
    assert_equal 5, key_generator.generate_new_key.length
  end

  def test_get_rotation_return_value
    key_generator = KeyGenerator.new
    assert_equal 2, key_generator.get_rotation("12345", "a").length
    assert_equal "12", key_generator.get_rotation("12345", "a")
    assert_equal "23", key_generator.get_rotation("12345", "b")
    assert_equal "34", key_generator.get_rotation("12345", "c")
    assert_equal "45", key_generator.get_rotation("12345", "d")
  end
end
