def penultimate(string)
  string.split[-2]
end

def middle_word(string)
  words_array = string.split
  if words_array.size.odd?
    words_array[words_array.size/2]
  else 
    puts "No middle word available"
  end
end

p penultimate('last word')
p penultimate('Launch School is great!')
p middle_word('hello how are you doing?')
p middle_word('')
p middle_word('hello')
p middle_word('hello john')
