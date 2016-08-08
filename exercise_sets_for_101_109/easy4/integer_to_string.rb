DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

#my solution
def integer_to_string(int)
  arr = []
  arr << 0 if int == 0
  while int > 0
    arr << int % 10
    int /= 10
  end
  arr.reverse.join
end

#other solution
def integer_to_string2(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(1234)
p integer_to_string(0)
p integer_to_string(5000)
p "----------------"
p integer_to_string2(1234)
p integer_to_string2(0)
p integer_to_string2(5000)

