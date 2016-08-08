NUMBERS = {
  /zero/i => 0, /one/i => 1, /two/i => 2, /three/i => 3, /four/i => 4, 
  /five/i => 5, /six/i => 6, /seven/i => 7, /eight/i => 8, /nine/i => 9
}

def word_to_digit(string)
  NUMBERS.each do |word_num, value|
    string.gsub!(/#{word_num}\s|#{word_num}\b/, value.to_s)
  end

  string.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

p word_to_digit("Please call me at ZERO Five five five one two three four five six. Thanks.")