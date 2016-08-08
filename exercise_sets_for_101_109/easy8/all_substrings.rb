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

def substrings2(string)
  substrings = []
  (0...string.size).each do |index|
    this_substring = string[index..-1]
    substrings.concat(leading_substrings2(this_substring))
  end
  substrings 
end

p substrings('abcde')
p substrings2('abcde')
