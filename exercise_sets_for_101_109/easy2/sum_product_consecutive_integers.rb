def prompt(msg)
  puts ">> #{msg}"
end

def result(integer, operation)
  if operation == 's'
    (1..integer).reduce(:+)
  elsif operation == 'p'
    (1..integer).reduce(:*)
  end
end

def another?
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt "Please enter 'y' or 'n'"
  end 
end

prompt "Welcome to sum or product of consecutive integers calculator!"

loop do
  integer = ''
  loop do
    prompt "Please enter an integer greater than 0"
    integer = gets.chomp.to_i
    if integer > 0 
      break
    else
      prompt "Not a valid number."
    end
  end

  operation = ''
  loop do
    prompt "Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp.downcase
    if operation == 's' || operation == 'p'
      break
    else
      prompt "Not a valid operation."
    end
  end

  prompt "The sum of the integers between 1 and #{integer} is #{result(integer, operation)}"

  prompt "Perform another calculation? (y/n)"
  break unless another?
end

