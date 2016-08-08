class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# hello = Hello.new
# p hello.hi 
# p "Hello"

# hello = Hello.new
# p hello.bye
# p "Error as neither Hello nor Greeting has a bye instance method defined"

# hello = Hello.new
# p hello.greet
# print "Error because no argument passed into greet method"

# hello = Hello.new
# p hello.greet("Goodbye")
# p "Goodbye"

p Hello.hi
print "Error because Hello does not contain a class method defined as self.hi"