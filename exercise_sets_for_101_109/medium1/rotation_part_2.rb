def rotate_rightmost_digits(number, n) 
  num_array = number.to_s.chars
  new_num_array = (num_array[0..-(n+1)] + num_array[-n..-1].rotate)
  new_num_array.join.to_i
end

p rotate_rightmost_digits(12345, 3)