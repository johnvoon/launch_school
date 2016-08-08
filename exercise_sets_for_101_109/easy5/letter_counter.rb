def word_sizes(string)
  hash = Hash.new(0)
  string.split.each do |word|
    hash[word.size] += 1
  end
  hash
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')