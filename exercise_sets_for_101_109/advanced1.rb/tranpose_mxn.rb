def transpose3(matrix)
  # result = []
  # (0..2).each do |column_index|
  #   result << (0..2).map {|row_index| matrix[row_index][column_index]}
  # end
  # result
  matrix.length
end 

p transpose([[1,2,3,4]])
p transpose([[1], [2], [3], [4]])
p transpose([1,2,3,4,5], [4,3,2,1,0], [3,7,8,6,2])
p transpose([[1]])
