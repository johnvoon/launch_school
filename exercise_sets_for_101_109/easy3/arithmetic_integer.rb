def prompt(msg)
  puts "==> #{msg}"
end

prompt "Enter the first number"
first = gets.chomp.to_i
# if first == integer (use regexp to validate)
#   first = first.to_i
# if first == has decimal points (use regexp to validate)
#   first = first.to_f

prompt "Enter the second number"
second = gets.chomp.to_i
# if second == 0
#  error handling: please enter second number again 
#  prompt enter second number again

sum = first + second
difference = first - second 
product = first * second
quotient = first / second
remainder = first % second
square = first ** second

prompt "#{first} + #{second} = #{sum}"
prompt "#{first} - #{second} = #{difference}"
prompt "#{first} * #{second} = #{product}"
prompt "#{first} / #{second} = #{quotient}"
prompt "#{first} % #{second} = #{remainder}"
prompt "#{first} ** #{second} = #{square}"
