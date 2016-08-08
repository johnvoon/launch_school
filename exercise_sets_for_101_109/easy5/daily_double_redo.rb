def crunch(string)
  index = 0
  duplicates_removed = ''
  while index < string.length
    duplicates_removed << string[index] unless string[index] == string[index + 1]
    index += 1
  end

  duplicates_removed
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabcba')
p crunch('ggggggggg')
p crunch('a')
p crunch('')