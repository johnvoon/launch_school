def running_total(arr)
  result = []
  total = 0
  arr.each {|n| result << total += n }
  result
end

def running_total2(arr)
  sum = 0
  arr.map { |n| sum += n }
end

def running_total3(arr)
  sum = 0
  arr.each_with_object([]) {|n, arr| arr << sum += n }
end

def running_total4(arr)
  array_of_n = []
  result = []
  total = 0
  arr.each do |n|
    array_of_n << n
    result << array_of_n.reduce(:+) 
  end
  result
end

p running_total([1, 2, 3, 4])
p running_total2([1, 2, 3, 4])
p running_total3([1, 2, 3, 4])
p running_total4([1, 2, 3, 4])
