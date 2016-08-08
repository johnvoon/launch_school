def append_word_to_string(string)
  string += " rutabaga"
end

def append_word_to_array(array)
  array << "rutabaga"
end

my_string = append_word_to_string("pumpkins")
my_array = ["pumpkins"]
append_word_to_string(my_string)
append_word_to_array(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"