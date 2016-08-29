array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }
p array.select { |num| puts num }
p array.select { |num| num + 1 }

def select(array)
  index = 0
  selected_elements = []

  while index < array.length
    current_element = array[index]
    block_return_value = yield(current_element)
    selected_elements << current_element if block_return_value
    index += 1
  end

  selected_elements
end

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }