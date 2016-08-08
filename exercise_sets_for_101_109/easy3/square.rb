def multiply(first, second)
  first * second
end

def square(number)
  multiply(number, number)
end

def power(number, power)
  multiply(number, 1)**power
end

p square(6)

p power(2, 8)