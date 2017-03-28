require 'pry'
class RotationGenerator
  def generate_new_rotation
    key = ""
    key << rand(9).to_s until key.length == 5
    key
  end

  def get_rotation(key_input, rotation)
    #binding.pry
    if rotation == "a"
      key_input[0..1]
    elsif rotation == "b"
      key_input[1..2]
    elsif rotation == "c"
      key_input[2..3]
    else 
      key_input[3..4]
    end
  end
  
end
