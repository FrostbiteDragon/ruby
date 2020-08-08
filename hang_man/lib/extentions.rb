class Extentions
  def self.format_word(word, visible_letters)
    message = ''
    word.chars.each { |char|
      if (visible_letters.include?(char))
        message << char
      else
        message << '_'
      end

      message << ' '
    }
    return message
  end
end