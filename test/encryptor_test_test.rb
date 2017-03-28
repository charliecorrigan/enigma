require 'minitest'
require 'minitest/autorun'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test
  def test_it_exists
    e = Encrypt.new
    assert e
  end
end
