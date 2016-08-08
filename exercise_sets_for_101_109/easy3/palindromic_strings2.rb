def palindrome2?(str)
  string = str.downcase.gsub(/\W+/, '')
  string == string.reverse
end

def palindrome2_v2?(str)
  string = str.downcase.delete('^a-z0-9')
  string == string.reverse
end

p palindrome2?("Madam")
p palindrome2?("Madam, I'm adam")
p palindrome2_v2?("Madam")
p palindrome2?_v2?("Madam, I'm adam")