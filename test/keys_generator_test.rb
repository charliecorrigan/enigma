require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys_generator'

class TestKeysGenerator < Minitest::Test
  def test_existence_of_keys_generator_class
    keys_generator = KeysGenerator.new(nil, nil)
    assert_instance_of KeysGenerator, keys_generator
  end

  def test_key_input_decision
    keys_generator = KeysGenerator.new(nil, nil)
    full_rotation = keys_generator.key_input_decision
    assert_equal String, full_rotation.class
    assert_equal 5, full_rotation.length

    keys_generator = KeysGenerator.new("12345", nil)
    full_rotation = keys_generator.key_input_decision
    assert_equal String, full_rotation.class
    assert_equal 5, full_rotation.length
    assert_equal "12345", full_rotation
  end

  def test_rotation
    keys_generator = KeysGenerator.new(nil, nil)
    rotation_a = keys_generator.rotation("12345", "a")
    assert_equal String, rotation_a.class
    assert_equal 2, rotation_a.length
    assert_equal "12", rotation_a

    keys_generator = KeysGenerator.new(nil, nil)
    full_rotation = keys_generator.key_input_decision
    rotation_a = keys_generator.rotation(full_rotation, "a")
    assert_equal String, rotation_a.class
    assert_equal 2, rotation_a.length
  end

  def test_offset
    keys_generator = KeysGenerator.new(nil, nil)
    offset_a = keys_generator.offset("a")
    assert_equal String, offset_a.class
    assert_equal 1, offset_a.length

    keys_generator = KeysGenerator.new(nil, 260317)
    offset_a = keys_generator.offset("a")
    assert_equal String, offset_a.class
    assert_equal 1, offset_a.length
    assert_equal "0", offset_a
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
