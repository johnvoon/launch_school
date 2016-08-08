def bubble_sort!(array)
  loop do
    array[0..-2].each_index do |index|
      next if array[index] < array[index + 1]
      array[index], array[index + 1] = array[index + 1], array[index]
    end
    break if array.each_cons(2).all? { |first, second| first < second }
  end
end


def bubble_sort2!(array)
  loop do
    swapped = false
    array[0..-2].each_index do |index|
      next if array[index] < array[index + 1]
      array[index], array[index + 1] = array[index + 1], array[index]
      swapped = true
    end
    break unless swapped
  end
end

def bubble_sort3!(array)
  n = array.length
  loop do
    swapped = false
    1.upto(n - 1) do |index|
      next if array[index - 1] < array[index]
      array[index-1], array[index] = array[index], array[index-1]
      swapped = true
    end
    n -= 1

    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = [5, 3]
bubble_sort2!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort2!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort2!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = [5, 3]
bubble_sort3!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort3!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort3!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
