class KeyGenerator

  def generate_new_key
    key = ""
    key << rand(9).to_s until key.length == 5
    key
  end
  
end
