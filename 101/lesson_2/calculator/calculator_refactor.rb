# ask user for 2 numbres
# ask user for operation to perform
# perform operation on the 2 numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end
# NB: Is there a better way to validate that the user has input a number? e.g. 0
# NB: You can call to_i or to_f to convert strings to integers and floats, respectively.

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
# NB: This method is a bit dangerous as we are relying on the case statement being the last expression in the method. What if we need to add some code after the case statement within the method? What can be changed to keep the method working with the rest of the program?

prompt "Welcome to Calculator! Enter your name:"
# NB: parentheses are optional even when passing arguments in to methods. This will be useful if using a DSL written in Ruby, like Rspec or Rails
# NB: Kernel in Kernel.prompt can be omitted because when we write Ruby code that's not in a class, we are working within an object called main, which is an instance of Object. The Kernel module is automatically loaded by Object, giving us access to all of its methods. Basically Kernel methods are available everywhere in Ruby.
# NB: Messages such as these could perhaps be moved into some configuration file to be accessed by key. This would allow easier management of these messages and we could even internalize the messages.
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt "Not a valid number"
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("Not a valid number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using calculator. Good bye!")
