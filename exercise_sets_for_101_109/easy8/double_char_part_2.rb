CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    if char =~ /[aeiou0-9\W\s]/i
      result << char
    else 
      result << char * 2
    end
  end
  result
end

def double_consonants2(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

p double_consonants('String')
p double_consonants('Hello-World!')
p double_consonants('July 4th')
p double_consonants('')
p double_consonants2('String')
p double_consonants2('Hello-World!')
p double_consonants2('July 4th')
p double_consonants2('')