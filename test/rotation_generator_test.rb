require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation_generator'

class TestRotationGenerator < Minitest::Test
  def test_existence_of_rotation_generator_class
    rotation_generator = RotationGenerator.new
    assert_equal true, rotation_generator = !nil
  end

  def test_generate_new_rotation_return_value
    rotation_generator = RotationGenerator.new
    assert_equal String, rotation_generator.generate_new_rotation.class
    assert_equal 5, rotation_generator.generate_new_rotation.length
  end

  def test_get_rotation_return_value
    rotation_generator = RotationGenerator.new
    assert_equal 2, rotation_generator.get_rotation("12345", "a").length
    assert_equal "12", rotation_generator.get_rotation("12345", "a")
    assert_equal "23", rotation_generator.get_rotation("12345", "b")
    assert_equal "34", rotation_generator.get_rotation("12345", "c")
    assert_equal "45", rotation_generator.get_rotation("12345", "d")
  end
end
