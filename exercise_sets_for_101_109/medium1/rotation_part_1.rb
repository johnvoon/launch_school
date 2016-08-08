def rotate_array(arr)
  new_array = arr.drop(1) + arr.take(1)
end

p rotate_array([1,2,3,4,5])

