require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_generator.rb'

class TestEncryptionGenerator < Minitest::Test
  def test_existence_of_encryption_generator_class
    encryption_generator = EncryptionGenerator.new
    refute_nil encryption_generator
  end
end