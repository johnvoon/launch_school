def fibonacci(number) #defines a method allowing a number to be passed as an argument to the "number" parameter
  if number < 2 #if the number passed is less than 0 or 1, just return that number
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2) #otherwise return a number which adds 
  end
end

puts fibonacci(6)