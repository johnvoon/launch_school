def sum_square_difference(n)
  array1 = []
  array2 = []

  1.upto(n) do |number|
    array1 << number
    array2 << number**2
  end

  array1.reduce(:+)**2 - array2.reduce(:+)

end

p sum_square_difference(3)
p sum_square_difference(10)
p sum_square_difference(1)
p sum_square_difference(100)