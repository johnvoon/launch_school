puts "Please enter a number." 

def number_range(num = gets.chomp.to_i) 
  if num < 0
    "This is a negative number"
  elsif num >= 0 && num <= 50
    "This number is between 0 and 50" 
  elsif num >= 51 && num <= 100
    "This number is between 51 and 100"
  else 
    "This number is above 100"
  end
end

