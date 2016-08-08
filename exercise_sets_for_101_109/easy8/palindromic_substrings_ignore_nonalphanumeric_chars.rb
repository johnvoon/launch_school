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
  modified_string = string.downcase.gsub(/[^a-zA-Z0-9]/, '')
  palindromes = []
  all_substrings = substrings(modified_string)
  all_substrings.each do |substring|
    unless substring.size <= 1
      palindromes << substring if substring == substring.reverse
    end
  end
  palindromes
end

p palindromes('abcd')
p palindromes('madaM')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')