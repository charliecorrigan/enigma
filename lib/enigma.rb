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
end
