def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze
end

def cleanup2(string)
  new_string = ''
  string.each_char do |char|
    ("a".."z").cover?(char) ? new_string << char : new_string << ' '
  end
  new_string.squeeze
end

def cleanup3(string)
  string.chars.map do |char|
    ("a".."z").cover?(char) ? char : char = ' '
  end.join.squeeze
end

p cleanup("---what's my +*& line?")
p cleanup2("---what's my +*& line?")
p cleanup3("---what's my +*& line?")