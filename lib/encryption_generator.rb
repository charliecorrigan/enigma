require './lib/character_map'
require './lib/key_generator'

class EncryptionGenerator
  attr_reader :character_map, :rotation_a,  :rotation_b,  :rotation_c,  :rotation_d

  def initialize
    @character_map = CharacterMap.new
    key_generator = KeyGenerator.new
    key_generator.generate_new_key
    @rotation_a = key_generator.get_rotation("a")
    @rotation_b = key_generator.get_rotation("b")
    @rotation_c = key_generator.get_rotation("c")
    @rotation_d = key_generator.get_rotation("d")
  end
end
