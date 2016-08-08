def transpose(matrix)
  result = []
  (0...matrix[0].length).each do |column_index|
    result << (0...matrix.length).map {|row_index| matrix[row_index][column_index]}
  end
  
  result
end 


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]] 