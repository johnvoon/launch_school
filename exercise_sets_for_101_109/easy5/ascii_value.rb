def ascii_value(str)
  ascii_arr = str.chars.map {|char| char.ord}
  ascii = 0
  ascii_arr.each {|char| ascii += char }
  ascii
end

def ascii_value2(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

p ascii_value("Four score")
p ascii_value("Launch School")
p ascii_value('a')
p ascii_value('')

p ascii_value2("Four score")
p ascii_value2("Launch School")
p ascii_value2('a')
p ascii_value2('')