# frozen_string_literal: true

def caesar_cipher(message, shift_factor)
  alphabet = ('a'..'z').to_a
  encripted_message = ''

  message.chars.map { |character|
    encripted_message += if character =~ /[a-z]/
      alphabet[(alphabet.index(character.downcase) + shift_factor) % 26]
    elsif character =~ /[A-Z]/
      alphabet[(alphabet.index(character.downcase) + shift_factor) % 26].upcase
    else
      character
    end
  }
  encripted_message
end

puts caesar_cipher("What a string!", 5)
