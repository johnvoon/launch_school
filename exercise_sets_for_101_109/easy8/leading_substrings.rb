def leading_substrings(string)
  substrings = []
  string.chars.each_index do |index|
    substrings << string[0..index]
  end
  substrings
end

def leading_substrings2(string)
  substrings = []
  1.upto(string.size) do |count|
    substrings << string[0, count]
  end
  substrings
end

p leading_substrings('abc')
p leading_substrings('a')
p leading_substrings('xyzzy')
p leading_substrings2('abc')
p leading_substrings2('a')
p leading_substrings2('xyzzy')
