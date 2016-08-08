DIGITS = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
          '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10 }

def string_to_integer(number)
  array = number.chars.map {|char| DIGITS[char]}
  sum = 0
  array.each {|n| sum = sum * 10 + n}
  sum
end   

p string_to_integer('12231313')