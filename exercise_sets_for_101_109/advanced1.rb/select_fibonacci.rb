def return_fibonaccis(array)
  fibonacci_array = [1, 1]
  first, last = [1, 1]
  fibonacci = 0
  loop do 
    fibonacci = first + last
    break if fibonacci >= array.length - 1
    fibonacci_array << fibonacci

    first = last
    last = fibonacci
  end

  fibonacci_array
end

def select_fibonacci(array)
  array.select do |number|
    fibonacci_numbers = return_fibonaccis(array)
    fibonacci_numbers.include?(array.index(number))
  end
end

array = [1,2,3,4,5,6,7,8,9,10]
p return_fibonaccis(array)
p select_fibonacci(array)