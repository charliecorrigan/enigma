class KeysGenerator
  attr_reader :input, :formatted_date

  def initialize(input, formatted_date)
    @input = input
    @formatted_date = formatted_date
  end
  
  def key_input_decision
    if input == nil
      rotation_generator = RotationGenerator.new
      full_rotation = rotation_generator.generate_new_rotation
      full_rotation
    else
      input
    end  
  end  

  def rotation(full_rotation, letter)
    rotation_generator = RotationGenerator.new
    rotation_generator.get_rotation(full_rotation, letter)
  end  

  def offset(letter)
    offset_generator = OffsetGenerator.new(formatted_date)
    offset_generator.generate_offset(letter)
  end

  def generate_keys
    full_rotation = key_input_decision
    keys = []
    keys << rotation(full_rotation, "a").to_i + offset("a").to_i
    keys << rotation(full_rotation, "b").to_i + offset("b").to_i
    keys << rotation(full_rotation, "c").to_i + offset("c").to_i
    keys << rotation(full_rotation, "d").to_i + offset("d").to_i
    keys
    
  end
end