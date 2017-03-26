require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_map.rb'

class TestCharacterMap < Minitest::Test
  def test_existence_of_character_map_class
    character_map = CharacterMap.new
    refute_nil character_map
  end

  def test_character_map_values
    character_map = CharacterMap.new
    assert_equal Hash, character_map.map.class
    assert_equal 0, character_map.map["a"]
    assert_equal 25, character_map.map["z"]
    assert_equal 26, character_map.map["0"]
    assert_equal 35, character_map.map["9"]
    assert_equal 36, character_map.map[" "]
    assert_equal 38, character_map.map[","]
end


end
