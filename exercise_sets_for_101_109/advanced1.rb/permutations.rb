require 'pry'

def permutations(array)
  return [array] if array.length == 1
    
  result = []
  array.each_with_index do |element, index|
    sub_array = array[0...index] + array[(index + 1)..-1]
    puts sub_array.inspect
    sub_permutations = permutations(sub_array)
    sub_permutations.each do |permutation|
      result << [element] + permutation
    end
  end

  puts result.inspect
  result
end

def string_permutations(string)
  return string if string.length == 1
    
  result = []
  split_string = string.split('')
  split_string.each_with_index do |element, index|
    sub_array = string[0...index] + string[(index + 1)..-1]
    sub_permutations = string_permutations(sub_array)
    sub_permutations.split('').each do |permutation|
      result << [element] + permutation
    end
  end
  result
end

# p permutations([2])
# p permutations([1,2])
# p permutations([1,2,3])
p permutations([1,2,3,4])
p string_permutations("aabb")


