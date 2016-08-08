def prompt_entry(nth)
  puts "==> Enter the #{nth} number"
end

numbers = []

prompt_entry("1st")
numbers << gets.chomp.to_i

prompt_entry("2nd")
numbers << gets.chomp.to_i

prompt_entry("3rd")
numbers << gets.chomp.to_i

prompt_entry("4th")
numbers << gets.chomp.to_i

prompt_entry("5th")
numbers << gets.chomp.to_i

prompt_entry("last")
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}"
end
