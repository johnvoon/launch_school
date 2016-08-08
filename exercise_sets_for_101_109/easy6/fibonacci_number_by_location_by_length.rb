def find_fibonacci_index_by_length(number_of_digits)
  fibonacci_numbers = [1, 1]
  first, last = [1, 1]
  index = 3
  loop do 
    fibonacci = first + last
    fibonacci_numbers << fibonacci
    break if fibonacci_numbers[index].to_s.length == number_of_digits
    
    first = last
    last = fibonacci
    index += 1
  end
  
  p fibonacci_numbers
  index
end

p find_fibonacci_index_by_length(2)