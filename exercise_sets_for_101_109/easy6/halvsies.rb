def halvsies(array)
  first_half = array[0, (array.size / 2.0).ceil] #retrieves 3 elements
  second_half = array[first_half.size..array.size-1]
  [first_half, second_half]
end

p halvsies([1,2,3,4])
p halvsies([1,5,2,4,3])
p halvsies([5])
p halvsies([])