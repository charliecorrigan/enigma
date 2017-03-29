require './lib/character_map'
require './lib/keys_generator'

class EncryptionGenerator
  attr_reader :text, :input, :formatted_date, :character_map

  def initialize(text, input = nil, formatted_date = nil)
    @text = text
    @input = input
    @formatted_date = formatted_date
    @character_map = CharacterMap.new
  end

  def translate_text_to_numbers
    characters_as_numbers = text.split("").map do |character|
      character_map.map[character]
    end
  end

  def generate_cipher(rotation_direction)
    keys_generator = KeysGenerator.new(input, formatted_date)
    keys = keys_generator.generate_keys
    index = 0
    cipher_numbers = []
    sum = 0
    characters_as_numbers = translate_text_to_numbers
    characters_as_numbers.each do |character|
      if rotation_direction == "encrypt"
        result = (character + keys[index]) % 39
      else
        result = character - keys[index]
          while result < 0
            result += 39
          end  
      end
      if index == 3
        index = 0
      else
        index += 1
      end
      cipher_numbers << result
    end
    cipher_letters = cipher_numbers.map do |number|
      character_map.map.key(number)
    end
    cipher = cipher_letters.join
  end
end
