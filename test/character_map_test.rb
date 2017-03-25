require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_map.rb'

class TestCharacterMap < Minitest::Test
  def test_existence_of_character_map_class
    character_map = CharacterMap.new
    refute_nil character_map
  end
end