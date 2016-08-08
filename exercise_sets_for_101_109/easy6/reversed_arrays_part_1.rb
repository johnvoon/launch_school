def reverse_array!(list)
  index = 0
  loop do
    new = list.pop
    list.insert(index, new)
    index += 1
    break if index == list.length
  end

  list
end

def reverse2!(array)
  left_index = 0
  right_index = -1
  while left_index < array.length / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list1 = [1,2,3,4,5]
result = reverse_array!(list1)
p list1
p list1.object_id == result.object_id

list2 = %w(a b c d e)
reverse_array!(list2)
p list2 == ["e", "d", "c", "b", "a"]

list3 = ["abc"]
reverse_array!(list3)
p list3 == ["abc"]

list4 = []
reverse_array!(list4)
list4 == []



list1 = [1,2,3,4,5]
result = reverse2!(list1)
p list1
p list1.object_id == result.object_id

list2 = %w(a b c d e)
reverse2!(list2)
p list2 == ["e", "d", "c", "b", "a"]

list3 = ["abc"]
reverse2!(list3)
p list3 == ["abc"]

list4 = []
reverse2!(list4)
list4 == []