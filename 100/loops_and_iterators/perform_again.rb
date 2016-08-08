# perform_again.rb
#this asks the program to do something while a condition is true or not true

loop do
  puts "Do you want to do that again?" #when the app is run, this string is first printed, prompting the user to answer yes or no
  answer = gets.chomp #prompts user to input a value
  if answer != "Y" #as long as the user enters Y, run the loop again, but once the user enters something other than Y, exit the loop
    break
  end
end
