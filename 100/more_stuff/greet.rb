# greet.rb

# does not print anything, just returns a value
def space_out_letters(person) #creates method to space out letters that takes a person argument
  return person.split("").join(" ") #splits the string into an array and joins it
end

def greet(person)
  return "H e l l o, " + space_out_letters(person)
end

def decorate_greeting(person)
  puts "" + greet(person) + ""
end

decorate_greeting("John")
decorate_greeting(1)