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
    key_generator.generate_new_key
    assert_equal 2, key_generator.get_rotation("a").length
    key_generator.key = "12345"
    assert_equal "12", key_generator.get_rotation("a")
    assert_equal "23", key_generator.get_rotation("b")
    assert_equal "34", key_generator.get_rotation("c")
    assert_equal "45", key_generator.get_rotation("d")
  end
end
