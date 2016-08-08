def word_cap(string)
  string.split.map{ |word| word.capitalize }.join(' ')
end

def word_cap2(string)
  string.split.map(&:capitalize).join(' ')
end

def word_cap3(string)
  string.split.map do |word|
    word[0].upcase + word[1..word.length].downcase
  end.join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
p word_cap('this is a "quoted" word')
p word_cap2('four score and seven')
p word_cap2('the javaScript language')
p word_cap2('this is a "quoted" word')
p word_cap3('four score and seven')
p word_cap3('the javaScript language')
p word_cap3('this is a "quoted" word')