require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_generator.rb'

class TestEncryptionGenerator < Minitest::Test
  def test_existence_of_encryption_generator_class
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_instance_of EncryptionGenerator, encryption_generator
  end

  def test_access_to_character_map
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal 0, encryption_generator.character_map.map["a"]
  end

  def test_access_to_generate_keys
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal String, encryption_generator.rotation_a.class
  end

  def test_access_to_generate_offsets
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal String, encryption_generator.offset_a.class
  end

  def test_encryption_keys_generator_return
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal Array, encryption_generator.encryption_keys.class
    assert_equal 4, encryption_generator.encryption_keys.length
    #TODO - figure out how to test specific return values
  end

  def test_if_translate_text_to_numbers
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal Array, encryption_generator.translate_text_to_numbers.class
    assert_equal 11, encryption_generator.translate_text_to_numbers.length
    assert_equal Fixnum, encryption_generator.translate_text_to_numbers[0].class
  end

  def test_generate_cipher_return_value
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal String, encryption_generator.generate_cipher.class
    assert_equal 11, encryption_generator.generate_cipher.length
  end

  def test_generate_cipher_for_accurate_encryption
    encryption_generator = EncryptionGenerator.new("hello world")
    encryption_generator.keys = [2, 4, 2, 4]
    assert_equal "jinpqbystpf", encryption_generator.generate_cipher
  end
 
  def test_generate_cipher_for_accurate_encryption_with_key_in_argument
    encryption_generator = EncryptionGenerator.new("nick 1", "12345")
    result = encryption_generator.generate_cipher
    assert_equal "z9fzjp", result
  end
  
 end
