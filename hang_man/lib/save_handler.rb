require "msgpack"
MessagePack::DefaultFactory.register_type(0x00, Symbol)

class SaveHandler
  def self.save(word, letters, guesses)
    File.write("save", MessagePack.pack({
      :word => word,
      :letters => letters,
      :guesses => guesses
    }))
  end

  def self.load
    MessagePack.unpack(File.read("save"))
  end
end