def word_letter_swap(str)
  str[0], str[-1] = str[-1], str[0]
  str
end

def letter_swap(str)
  str.split(' ').map {|word| word_letter_swap(word)}.join(' ')
end

p letter_swap('Hello how are you doing')

def swap_first_last_characters(a, b)
  a, b = b, a
end