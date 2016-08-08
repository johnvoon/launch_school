def multiply_list(arr1, arr2)
  products = []
  arr1.each_with_index do |num, index|
    products << num * arr2[index]
  end
  products
end

# not the solution, just testing
def multiply_list2(arr1, arr2) 
  products = []
  arr1.each do |item_1|
    arr2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products
end

def multiply_list3(arr1, arr2)
  arr1.zip(arr2).map {|arr| arr.reduce(1, :*)}
end

p multiply_list([3,5,7], [9,10,11])
p multiply_list2([3,5,7], [9,10,11])
p multiply_list3([3,5,7], [9,10,11])