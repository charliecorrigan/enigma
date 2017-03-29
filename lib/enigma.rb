require './lib/encryption_generator'

class Enigma
  def encrypt(message, key = nil, date = nil)
    encryption_generator = EncryptionGenerator.new(message, key, date)
    encryption_generator.generate_cipher("encrypt")
  end

  def decrypt(message, key = nil, date = nil)
    encryption_generator = EncryptionGenerator.new(message, key, date)
    encryption_generator.generate_cipher("decrypt")  
  end

  def stopping_point
    99999
  end

  def crack(message)
    (0..99999).each do |num|
      cracked_text = decrypt(message, ("%05d" % num), date = nil)
      if cracked_text[-7..-1] == "..end.."
        return cracked_text
      end
    end
    return "Error! Brute force attack failed! Please turn in your hacker badge."
  #   cracked_text = decrypt(message, key, date)
  #   puts key
  #   return "Error! Brute force attack failed! Please turn in your hacker badge." if key.to_i + 1 > stopping_point
  #   if cracked_text[-7..-1] != "..end.."
  #     crack(message, "%05d" % (key.to_i + 1), date)
  #   else
  #     return cracked_text
  #   end
   end
end
