# case_statement.rb

a = 5

case a 
when 5
  puts "a is 5" #if a is 5, output a is 5
when 6
  puts "a is 6" #if a is 6, output a is 6
else 
  puts "a is neither 5, nor 6" #if a is neither 5 nor 6, output this line
end

a = 5

answer = case a
  when 5
    "a is 5"
  when 6
    "a is 6"
  else 
    "a is neither 5, nor 6"
  end

puts answer

a = 5

answer = case 
  when a == 5
    "a is 5"
  when a == 6
    "a is 6"
  else 
    "a is neither 5, nor 6"
  end

puts answer

