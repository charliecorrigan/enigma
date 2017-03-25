require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_generator.rb'

class TestEncryptionGenerator < Minitest::Test
  def test_existence_of_encryption_generator_class
    encryption_generator = EncryptionGenerator.new
    refute_nil encryption_generator
  end

  def test_access_to_character_map
    encryption_generator = EncryptionGenerator.new
    assert_equal 1, encryption_generator.character_map.map["a"]
  end

  def test_access_to_generate_keys
    encryption_generator = EncryptionGenerator.new
    assert_equal String, encryption_generator.rotation_a.class
  end

  def test_access_to_generate_offsets
    encryption_generator = EncryptionGenerator.new
    assert_equal String, encryption_generator.offset_a.class
  end

#key_a, key_b
  def test_encryption_keys_generator_return
    encryption_generator = EncryptionGenerator.new
    assert_equal Array, encryption_generator.encryption_keys.class
    assert_equal 4, encryption_generator.encryption_keys.length
  end
end
