numbers = [1, 2, 3, 4, 5, 6, 7, 8]
numbers.each_with_index do |number, index|
  p "#{index} #{numbers.inspect} #{number}"
  numbers.pop(1)
end