hash = { :name => "John",
  :age => "27",
  :height => "160cm"
}

p hash

hash2 = { name: "John",
  age: "27",
  height: "160cm"
}


hash3 = Hash.new
hash3[:name] = "John"
hash3[:age] = "27"
hash3[:height] = "160cm"

p hash3
