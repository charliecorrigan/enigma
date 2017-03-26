require './lib/character_map'
require './lib/key_generator'
require './lib/offset_generator'
require 'pry'

class EncryptionGenerator
  attr_reader :text, :character_map, :rotation_a,  :rotation_b,  :rotation_c,  :rotation_d, :offset_a, :offset_b, :offset_c, :offset_d

  def initialize(text)
    @text = text
    @character_map = CharacterMap.new
    key_generator = KeyGenerator.new
    key_generator.generate_new_key
    @rotation_a = key_generator.get_rotation("a")
    @rotation_b = key_generator.get_rotation("b")
    @rotation_c = key_generator.get_rotation("c")
    @rotation_d = key_generator.get_rotation("d")
    offset_generator = OffsetGenerator.new
    @offset_a = offset_generator.generate_offset("a")
    @offset_b = offset_generator.generate_offset("b")
    @offset_c = offset_generator.generate_offset("c")
    @offset_d = offset_generator.generate_offset("d")
    encryption_keys
  end

  def encryption_keys
    keys = []
    keys << rotation_a.to_i + offset_a.to_i
    keys << rotation_b.to_i + offset_b.to_i
    keys << rotation_c.to_i + offset_c.to_i
    keys << rotation_d.to_i + offset_d.to_i
    keys
  end

  def translate_text_to_numbers
    characters_as_numbers = text.split("").map do |character|
      character_map.map[character]
    end
  end

  def generate_cipher
    index = 0
    cipher_numbers = []
    characters_as_numbers = translate_text_to_numbers
    #binding.pry
    characters_as_numbers.each do |character|
     sum = character + encryption_keys[index]
     #binding.pry
      if index == 3
        index = 0
      else
        index += 1
      end
      cipher_numbers << sum % 39
    end
    cipher_letters = cipher_numbers.map do |number|
      character_map.map.key(number)
    end
    # binding.pry
    cipher = cipher_letters.join
  end
end
