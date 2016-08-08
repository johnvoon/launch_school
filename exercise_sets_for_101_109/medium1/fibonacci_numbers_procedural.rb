def fibonacci(n)
  first, last = [1,1]
  3.upto(n) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(2)
p fibonacci(4)
p fibonacci(5)s
p fibonacci(6)
p fibonacci(7)
p fibonacci(20)
p fibonacci(100)
