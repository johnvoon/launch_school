def multisum(number)
  arr = []
  1.upto(number) do |num| 
    arr << num if num % 3 == 0 || num % 5 == 0
  end
  arr.reduce(:+)
end

def multisum2(max_value)
  sum = 0
  1.upto(max_value) do |num|
    if num % 3 == 0 || num % 5 == 0
      sum += num
    end
  end
  sum
end

p multisum(3)
p multisum(5)
p multisum(10)
p multisum(1000)

p multisum2(3)
p multisum2(5)
p multisum2(10)
p multisum2(1000)
