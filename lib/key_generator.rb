class KeyGenerator
  attr_accessor :key

  def generate_new_key
    @key = ""
    @key << rand(9).to_s until key.length == 5
    key
  end

  def get_rotation(rotation)
    if rotation == "a"
      key[0..1]
    elsif rotation == "b"
      key[1..2]
    elsif rotation == "c"
      key[2..3]
    else 
      key[3..4]
    end
  end
  
end
