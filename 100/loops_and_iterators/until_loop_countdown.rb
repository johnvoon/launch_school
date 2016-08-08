# until_loop_countdown.rb

x = gets.chomp.to_i #prompts user to enter a value and converts the inputted value into an integer

until x < 0
  puts x
  x -= 1
end #print x and then x - 1 until x and when x is less than 0, stop.

puts "Done!" #print Done when the loop has stopped executing