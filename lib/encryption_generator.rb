require './lib/character_map'
require './lib/key_generator'
require './lib/offset_generator'
require 'pry'

class EncryptionGenerator
  attr_reader :text, :character_map, :rotation_a,  :rotation_b,  :rotation_c,  :rotation_d, :offset_a, :offset_b, :offset_c, :offset_d, :key_generator, :key_input
  attr_accessor :keys

  def initialize(text, input = nil, formatted_date = nil)
    @text = text
    @character_map = CharacterMap.new
    key_input_decision(input)
    @rotation_a = key_generator.get_rotation(key_input, "a")
    @rotation_b = key_generator.get_rotation(key_input, "b")
    @rotation_c = key_generator.get_rotation(key_input, "c")
    @rotation_d = key_generator.get_rotation(key_input, "d")
    offset_generator = OffsetGenerator.new(formatted_date)
    @offset_a = offset_generator.generate_offset("a")
    @offset_b = offset_generator.generate_offset("b")
    @offset_c = offset_generator.generate_offset("c")
    @offset_d = offset_generator.generate_offset("d")
    encryption_keys 
  end

  def key_input_decision(input)
    if input == nil
      @key_generator = KeyGenerator.new
      @key_input = key_generator.generate_new_key
      return @key_input
    else
      @key_generator = KeyGenerator.new
      @key_input = input
    end  
  end

  def encryption_keys
    @keys = []
    @keys << rotation_a.to_i + offset_a.to_i
    @keys << rotation_b.to_i + offset_b.to_i
    @keys << rotation_c.to_i + offset_c.to_i
    @keys << rotation_d.to_i + offset_d.to_i
    keys
  end

  def translate_text_to_numbers
    characters_as_numbers = text.split("").map do |character|
      character_map.map[character]
    end
  end

  def generate_cipher(rotation_direction)
    index = 0
    cipher_numbers = []
    sum = 0
    characters_as_numbers = translate_text_to_numbers
    characters_as_numbers.each do |character|
     sum = character + keys[index]
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
    cipher = cipher_letters.join
  end
end
