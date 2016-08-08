def rotate_rightmost_digits(number, n) 
  num_array = number.to_s.chars
  new_num_array = (num_array[0..-(n+1)] + num_array[-n..-1].rotate)
  new_num_array.join.to_i
end

def max_rotation(num)
  fixed_n = num.to_s.length
  fixed_n.downto(2) {|n| num = rotate_rightmost_digits(num, n)}
  num
end

p max_rotation(1234)
  