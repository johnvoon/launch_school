def show_multiplicative_average(array)
  result = (array.reduce(1, :*).to_f / array.length).round(3)
  puts "The result is #{format("%.3f", result)}"
end

def show_multiplicative_average2(numbers)
  product = 1.to_f
  numbers.each {|number| product *= number}
  average = product / numbers.size
  puts format('%.3f', average)
end

show_multiplicative_average([3,5])
show_multiplicative_average([2,5,7,11,13,17])
show_multiplicative_average2([3,5])
show_multiplicative_average2([2,5,7,11,13,17])