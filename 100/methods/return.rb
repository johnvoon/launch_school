# return.rb

def add_three(number)
  return number + 3
  number + 4
end

  returned_value = add_three(4) #stores the result of the method (with 4 passed in as an argument) into the variable returned_value
puts returned_value #prints the variable returned_value

def just_assignment(number)
  foo = number + 3
end

puts just_assignment(2)