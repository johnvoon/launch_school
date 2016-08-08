def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map {|arr| arr.reduce(1, :*)}.sort
end

def multiply_all_pairs2(arr1, arr2)
  products = []
  arr1.each do |item_1|
    arr2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

p multiply_all_pairs([2,4], [4,3,1,2])