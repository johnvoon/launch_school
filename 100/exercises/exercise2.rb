numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.select do |number|
  if number.odd?
    puts number
  end
end