def swapcase(string)
  string.swapcase
end

def swapcase2(string)
  string.chars.map do |char|
    char =~ /[A-Z]/ ? char.downcase : char.upcase    
  end.join
end

def swapcase3(string)
  characters = string.chars.map do |char|
    if char =~ /a-z/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')
p swapcase2('CamelCase')
p swapcase2('Tonight on XYZ-TV')
p swapcase3('CamelCase')
p swapcase3('Tonight on XYZ-TV')

