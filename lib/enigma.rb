require './lib/encryption_generator'

class Enigma
  def encrypt(message, key, date)
    encryption_generator = EncryptionGenerator.new(message, key, date)
    encryption_generator.generate_cipher("encrypt")
  end
end
