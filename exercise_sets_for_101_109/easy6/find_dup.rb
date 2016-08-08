def find_dup(array)
  index = 0
  new_array = []
  loop do
    new_array << array[index]
    index += 1
    break if new_array.include?(array[index])
  end
  array[index]
end

def find_dup(array)
  array.find {|element| array.count(element) == 2}
end

p find_dup([4,2,31,34,44,55,5,3,55,80,90])
p find_dup([4,2,31,34,44,55,5,3,55,80,90])
