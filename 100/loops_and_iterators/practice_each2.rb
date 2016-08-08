#practice_each2.rb

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen'] #stores an array to the variable "names"
x = 1 

names.each do |name| #when iterating over the names array, store each element in the variable |name|
  puts "#{x}. #{name}" #for each element, print out x (the count) starting from 1 onwards and the element in the array stored in variable |name|
  x += 1 #increment the count by one each time
end