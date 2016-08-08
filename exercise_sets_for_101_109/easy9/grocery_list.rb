def buy_fruit(array)
  new_array = []
  array.each {|arr| new_array << [arr[0]] * arr[1]}
  new_array.flatten
end

def buy_fruit2(array)
  array.map {|fruit, quantity| [fruit] * quantity}.flatten
end

def buy_fruit3(array)
  array.map {|arr, arr2| p "#{arr}, #{arr2}"} 
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
p buy_fruit3([["apples", 3], ["orange", 1], ["bananas", 2]])