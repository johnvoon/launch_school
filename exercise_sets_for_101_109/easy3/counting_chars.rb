puts "Please write word or multiple words:"

word = gets.chomp
number_of_chars = word.chars.reject {|char| char == " "}.count
number_of_chars = word.delete(' ').length

puts "There are #{number_of_chars} characters in #{word}."

