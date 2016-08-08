# countdown.rb

x = gets.chomp.to_i #prompts user to input value and converts it to an integer

while x >= 0  
  puts x 
  x -= 1
end #if the number input by the user is more than 0, i.e. the evaluated result of x >= 0 is equal to true, enter the loop and print that number and then countdown

puts "Done!"