def fibonacci_last(n)
  first, last = [1,1]
  3.upto(n) do
    first, last = [last, first + last]
  end

  last.to_s[-1].to_i
end

def fibonacci_last2(n)
  last_2 = [1,1]
  3.upto(n) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

def fibonacci_last3(n)
  first, last = [1,1]
  3.upto(n) do
    first, last = [last, (first + last) % 10]
  end

  last
end

p fibonacci_last2(15)
p fibonacci_last2(20)
p fibonacci_last2(100)
p fibonacci_last2(100_001)
p fibonacci_last2(1_000_007)
p fibonacci_last2(123456789)
p fibonacci_last3(15)
p fibonacci_last3(20)
p fibonacci_last3(100)
p fibonacci_last3(100_001)
p fibonacci_last3(1_000_007)
p fibonacci_last3(123456789)