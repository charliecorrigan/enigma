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

  def test_keys_generator
    encryption_generator = EncryptionGenerator.new("hello world")
    keys_generator = KeysGenerator.new(nil, nil)
    keys = keys_generator.generate_keys
    assert_equal Array, keys_generator.generate_keys.class
    assert_equal 4, keys_generator.generate_keys.length
  end

  def test_if_translate_text_to_numbers
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal Array, encryption_generator.translate_text_to_numbers.class
    assert_equal 11, encryption_generator.translate_text_to_numbers.length
    assert_equal Fixnum, encryption_generator.translate_text_to_numbers[0].class
  end

  def test_generate_cipher_return_value
    encryption_generator = EncryptionGenerator.new("hello world")
    assert_equal String, encryption_generator.generate_cipher("encrypt").class
    assert_equal 11, encryption_generator.generate_cipher("encrypt").length
  end
 
  def test_generate_cipher_for_accurate_encryption_with_key_and_date_arguments
    encryption_generator = EncryptionGenerator.new("nick 1", "12345", 260317)
    result = encryption_generator.generate_cipher("encrypt")
    assert_equal "z9fzjp", result
  end
  
  def test_generate_cipher_decryption_option
    encryption_generator = EncryptionGenerator.new("z9fzjp", "12345", 260317)
    result = encryption_generator.generate_cipher("decrypt")
    assert_equal "nick 1", result
  end
 end
