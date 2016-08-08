def find_fibonacci_index_by_length(n)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= n

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(2)
p find_fibonacci_index_by_length(10)
p find_fibonacci_index_by_length(100)
p find_fibonacci_index_by_length(1000)
p find_fibonacci_index_by_length(10000)


