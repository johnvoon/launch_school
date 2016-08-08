def reverse_array(array)
  new_array = []
  array.reverse_each {|obj| new_array << obj }
  new_array
end

def reverse_array2(array)
  array.each_with_object([]) {|i, a| a << i}
end

list = [1,2,3]
new_list = reverse_array(list)
p list.object_id != new_list.object_id
p list
p new_list

list = [1,2,3]
new_list = reverse_array2(list)
p list.object_id != new_list.object_id
p list
p new_list
