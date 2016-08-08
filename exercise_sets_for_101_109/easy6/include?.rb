def include?(array, search_value) 
  array.any? {|element| element == search_value}
end

def include2?(array, search_value)
  array.each {|element| return true if search_value == element }
  false
end

def include3?(array, search_value)
  !!array.find_index(search_value)
end

p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6)
p include?([], 3)
p include?([nil], nil)
p include?([], nil)
p include2?([1,2,3,4,5], 3)
p include2?([1,2,3,4,5], 6)
p include2?([], 3)
p include2?([nil], nil)
p include2?([], nil)
p include3?([1,2,3,4,5], 3)
p include3?([1,2,3,4,5], 6)
p include3?([], 3)
p include3?([nil], nil)
p include3?([], nil)