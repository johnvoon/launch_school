# conditional.rb

puts "Put in a number"
a = gets.chomp.to_i #prompts user to input a value and converts it from a a string to an integer value

if a == 3 
  puts "a is 3" #if the input value is 3, print the value
elsif a == 4 
  puts "a is 4" #if the input value is 4, print the value
else 
  puts "a is neither 3, nor 4" #if the input value is neither 3 nor 4, print the words in quotation marks
end 
