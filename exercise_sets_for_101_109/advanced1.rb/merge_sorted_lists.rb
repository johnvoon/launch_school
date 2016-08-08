def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value| 
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

p merge([1,5,9, 10], [2,6,8])
p merge([1,1,3], [2,2])
p merge([], [1,4,5])
p merge([1,4,5], [])

# compare the first items of each array
# push in the lowest number
# compare the number that was not pushed in to the next element of the array in which an element was pushed
# push in the lowest number
# compare the number not pushed in to the next element of the array in which an element was pushed
# push in the lowest number
# compare number not pushed in to the next element of the array in which an element was not pushed 
# push in the lowest number
