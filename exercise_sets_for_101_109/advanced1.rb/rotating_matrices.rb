def rotate90(matrix)
  result = []
  (0...matrix[0].length).each do |row_index|
    result << (matrix.length-1).downto(0).to_a.map { |column_index| matrix[column_index][row_index] }
  end

  result
end

def rotate_right(matrix, degrees)
  result = []
  if degrees == 90
    (0...matrix[0].length).each do |row_index|
      result << (matrix.length-1).downto(0).to_a.map { |column_index| matrix[column_index][row_index] }
    end
  elsif degrees == 180
    (matrix.length-1).downto(0).each do |row_index|
      result << (matrix[0].length-1).downto(0).to_a.map { |column_index| matrix[row_index][column_index] }
    end
  elsif degrees == 270
    (matrix[0].length - 1).downto(0).each do |row_index|
      result << (0...matrix.length).to_a.map {|column_index| matrix[column_index][row_index]}
    end
  elsif degrees == 360
    result << rotate_right(rotate_right(rotate_right(rotate_right(matrix, 90), 90), 90), 90)
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# p rotate90(matrix1)
# p rotate90(matrix2)
p rotate_right(matrix1, 90)
p rotate_right(matrix1, 180)
p rotate_right(matrix1, 270)
p rotate_right(matrix1, 360)
p rotate_right(matrix2, 90)
p rotate_right(matrix2, 180)
p rotate_right(matrix2, 270)
p rotate_right(matrix2, 360)

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2