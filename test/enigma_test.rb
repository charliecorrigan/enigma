require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class TestEnigma < Minitest::Test
  def test_existence_of_enigma_class
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_encrypt_method_return_value_with_three_arguments
    enigma = Enigma.new
    assert_equal String, enigma.encrypt("nick 1", "12345", 260317).class
    assert_equal 6, enigma.encrypt("nick 1", "12345", 260317).length
    assert_equal "z9fzjp", enigma.encrypt("nick 1", "12345", 260317)
  end

  def test_encrypt_method_return_value_with_one_argument
    enigma = Enigma.new
    assert_equal String, enigma.encrypt("nick 1").class
    assert_equal 6, enigma.encrypt("nick 1").length
  end

  def test_decrypt_method_return_value_with_three_arguments
    enigma = Enigma.new
    assert_equal String, enigma.decrypt("z9fzjp", "12345", 260317).class
    assert_equal 6, enigma.decrypt("z9fzjp", "12345", 260317).length
    assert_equal "nick 1", enigma.decrypt("z9fzjp", "12345", 260317)   
  end

  def test_decrypt_method_return_value_characteristics_with_two_arguments
    enigma = Enigma.new
    assert_equal String, enigma.decrypt("z9fzjp", "12345").class
    assert_equal 6, enigma.decrypt("z9fzjp", "12345").length
  end

  def test_reciprocity_of_encrypt_and_decrypt_with_key_reassembly
    enigma = Enigma.new
    encrypted_message = enigma.encrypt("nick 1", "12345", 260317)
    decrypted_message = enigma.decrypt(encrypted_message, "12345", 260317)
    assert_equal "nick 1", decrypted_message
  end

  def test_reciprocity_of_encrypt_and_decrypt_with_key_as_argument
    enigma = Enigma.new
    encrypted_message = enigma.encrypt("nick 1", "12345")
    decrypted_message = enigma.decrypt(encrypted_message, "12345")
    assert_equal "nick 1", decrypted_message
  end

  def test_crack_method_return_value
    enigma = Enigma.new
    cracked = enigma.crack("hixyob81rppl.izq.c")
    assert_equal String, cracked.class
    assert_equal 18, cracked.length
    assert_equal "hello world..end..", cracked
  end

  def test_crack_method_error_handling_if_key_not_found
    enigma = Enigma.new
    cracked = enigma.crack("1i3md0pendlsi3jfpz")
    assert_equal "Error! Brute force attack failed! Please turn in your hacker badge.", cracked
  end

end
