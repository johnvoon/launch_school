def leading_substrings2(string)
  substrings = []
  1.upto(string.size) do |count|
    substrings << string[0, count]
  end
  substrings
end

def substrings(string)
  substrings = []
  string.chars.each_index do |index|
    substrings << leading_substrings2(string[index..string.length])
  end
  substrings.flatten
end

def palindromes(string)
  palindromes = []
  all_substrings = substrings(string)
  all_substrings.each do |substring|
    unless substring.size <= 1
      palindromes << substring if substring == substring.reverse
    end
  end
  palindromes
end

def palindromes2(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')
p palindromes2('abcd')
p palindromes2('madam')
p palindromes2('hello-madam-did-madam-goodbye')
p palindromes2('knitting cassettes')

