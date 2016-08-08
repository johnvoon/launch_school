puts "hash values can be arrays, e.g."

hash_array_values = { array1: [1,2,3],
array2: [2,3,4],
array3: [3,4,5]
}

p hash_array_values

puts "Yes, you can have an array of hashes, e.g."

array_of_hashes = [
  {name: "John", age: "27"}, 
  {name: "Kitty", age: "27"}
]

p array_of_hashes