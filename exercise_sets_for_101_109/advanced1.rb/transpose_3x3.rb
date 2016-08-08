require 'pry'

def transpose(matrix)
  matrix[0].zip(matrix[1], matrix[2])
end

def transpose2(matrix)
  transposed = [[],[],[]]
  index = 0
  nested_array = 0
  3.times do
    matrix.each_with_index do |row|
      transposed[nested_array] << row[index]
    end
    index += 1
    nested_array += 1
  end

  transposed
end

def transpose3(matrix)
  result = []
  (0..2).each do |column_index|
    result << (0..2).map {|row_index| matrix[row_index][column_index]}
  end
  result
end 

def transpose!(matrix)
  0.upto(matrix[0].length - 2) do |column_index|
    row_index = column_index + 1
    loop do
      matrix[column_index][row_index], matrix[row_index][column_index] = 
      matrix[row_index][column_index], matrix[column_index][row_index]
      row_index += 1
      break if row_index == matrix[0].length
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = transpose(matrix)

# p transpose(matrix)
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# new_matrix = transpose2(matrix)

# p transpose2(matrix)
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# p transpose3(matrix)
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

transpose!(matrix)
p matrix
