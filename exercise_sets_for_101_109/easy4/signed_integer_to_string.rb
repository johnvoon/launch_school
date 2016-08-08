require 'pry'

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  arr = []
  arr << 0 if int == 0
  while int > 0
    arr << int % 10
    int /= 10
  end
  arr.reverse.join
end

def integer_to_string2(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(int)
  if int > 0
    "+" + integer_to_string2(int)
  elsif int < 0
    "-" + integer_to_string2(-int)
  else integer_to_string2(int)
  end  
end

def signed_integer_to_string2(int)
  case int <=> 0
  when -1 then "-#{integer_to_string(-int)}" # "-" turns the negative number into a positive number first so that it works on the integer_to_string method
  when +1 then "+#{integer_to_string(int)}"
  else integer_to_string(int)
  end
end

def signed_integer_to_string3(int)
  int < 0 ? new_int = -int : new_int = int
  a = integer_to_string(new_int)
  case int <=> 0
  when -1 then "-#{a}"
  when +1 then "+#{a}"
  else a
  end
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)
p signed_integer_to_string2(4321)
p signed_integer_to_string2(-123)
p signed_integer_to_string2(0)
p signed_integer_to_string3(4321)
p signed_integer_to_string3(-123)
p signed_integer_to_string3(0)