# ask user for 2 numbres
# ask user for operation to perform
# perform operation on the 2 numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en' 
# NB: to change language, change LANGUAGE setting to es

def messages(message, lang='en') 
  MESSAGES[lang][message]
end
# NB: if no language is passed into the method, default will be en

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end
# NB: when the messages method is passed in as an argument to prompt, the MESSAGES[lang][message] is returned, i.e. the message in the desired language

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num # the string type is equal to the number input
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

prompt 'welcome'
# NB: parentheses are optional even when passing arguments in to methods. This will be useful if using a DSL written in Ruby, like Rspec or Rails
# NB: Kernel in Kernel.prompt can be omitted because when we write Ruby code that's not in a class, we are working within an object called main, which is an instance of Object. The Kernel module is automatically loaded by Object, giving us access to all of its methods. Basically Kernel methods are available everywhere in Ruby.
# NB: Messages such as these could perhaps be moved into some configuration file to be accessed by key. This would allow easier management of these messages and we could even internalize the messages.
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt 'valid_name'
  else
    break
  end
end

prompt('greeting') % {name: name} 

loop do # main loop
  number1 = ''
  loop do
    prompt 'first_number'
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt 'invalid_number'
    end
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt('invalid_number')
    end
  end

  
  prompt('operator_prompt')
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('invalid_operator')
    end
  end

  prompt('document_operation')

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

  prompt('result')

  prompt('another_calculation')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('farewell')
