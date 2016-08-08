def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0 # the use of the modulo is useful to make sure that the number has no remainder
    dividend -= 1
  end 
  divisors # this is necessary as a method returns the last line thereof. Without a return statement, the return value of the method is the last statement executed.
end

p factors(-1)