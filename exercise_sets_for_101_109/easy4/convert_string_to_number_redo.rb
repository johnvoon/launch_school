NUMBERS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  result = 0
  num_array = string.split('').map {|string_num| NUMBERS[string_num]}
  num_array.each {|num| result = result * 10 + num}
  result
end

p string_to_integer('4321')
p string_to_integer('570')