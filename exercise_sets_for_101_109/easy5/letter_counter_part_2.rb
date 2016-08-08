def word_sizes(string)
  new_string = string.delete "^(a-zA-Z)|\s"
  hash = Hash.new(0)
  new_string.split(' ').each do |word|
    hash[word.size] += 1
  end
  hash
end

def word_sizes2(string)
  hash = Hash.new(0)
  string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    hash[clean_word.size] += 1
  end
  hash
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')
p word_sizes2('Four score and seven.')
p word_sizes2('Hey diddle diddle, the cat and the fiddle!')
p word_sizes2("What's up doc?")
p word_sizes2('')