# frozen_string_literal: true
class Atbash
  ALPHABET = ('a'..'z').to_a
  ALPHABET_REVERSE = ALPHABET.reverse

  def self.encode(string)
    processed_string = string.downcase.delete("^a-z0-9")
    encoded_string = ''
    
    processed_string.each_char do |char|
      char_index = ALPHABET_REVERSE.find_index(char)
      encoded_string << ALPHABET[char_index]
    end

    encoded_string.gsub(/(.{5})/, '\1 ').rstrip
  end
end
