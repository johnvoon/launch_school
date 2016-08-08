# divide.rb

def divide(number, divisor) #creates method that takes a number and divisor (number to divide by) as arguments
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(14, 7)