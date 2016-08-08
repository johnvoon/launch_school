def crunch(string)
  string.squeeze
end

def crunch2(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

def crunch3(string)
  crunch_text = ''
  index = 0
  string.each_char do |char| 
    crunch_text << char unless string[index] == string[index + 1]
    index += 1
  end
  crunch_text
end

def crunch4(string)
  crunch_text = ''
  index = 0
  string.each_char do |char| 
    crunch_text << char unless string[index] == string[index + 1]
    index += 1
  end
  crunch_text
end

p crunch('dddaaaiillyy ddoouubbllee')
p crunch('4444abcabccba')
p crunch('gggggggggggg')
p crunch('a')
p crunch('')

p crunch2('dddaaaiillyy ddoouubbllee')
p crunch2('4444abcabccba')
p crunch2('gggggggggggg')
p crunch2('a')
p crunch2('')

p crunch3('dddaaaiillyy ddoouubbllee')
p crunch3('4444abcabccba')
p crunch3('gggggggggggg')
p crunch3('a')
p crunch3('')
