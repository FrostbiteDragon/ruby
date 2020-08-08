require "msgpack"
MessagePack::DefaultFactory.register_type(0x00, Symbol)

class SaveHandler
  def self.load_all; MessagePack.unpack(File.read('save')) end
  def self.load(index); load_all[index] end
  
  def self.save(word, letters, guesses, save_index = nil)
    if !File.exist?('save'); File.write('save', '') end

    save_hash = {
      :word => word,
      :letters => letters,
      :guesses => guesses
    }

    if File.zero?('save'); file = [save_hash]
    elsif save_index.nil?; file = load_all << save_hash
    else
      file = load_all
      file[save_index] = save_hash
    end

    File.write('save', MessagePack.pack(file))
  end
    
  def self.delete(index)
    file = load_all
    file.delete_at(index)

    File.write('save', MessagePack.pack(file))
  end
end