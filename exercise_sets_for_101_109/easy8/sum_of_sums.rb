def sum_of_sums(array)
  sum = 0
  array.each_index do |index|
    sum += array[0..index].reduce(:+)
  end
  sum
end

def sum_of_sums2(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers[0, count].reduce(:+)
  end
  sum_total
end


p sum_of_sums([3,5,2])
p sum_of_sums([1,5,7,3])
p sum_of_sums([4])
p sum_of_sums([1,2,3,4,5])
p sum_of_sums2([3,5,2])
p sum_of_sums2([1,5,7,3])
p sum_of_sums2([4])
p sum_of_sums2([1,2,3,4,5])


