def greeting(name, options = {}) #creates a method greeting which takes name and options as parameters
  if options.empty? #checks if anything was passed into the options parameter
    puts "Hi, my name is #{name}" #if true, just prints this line
  else #if false, outputs this line 
    puts "Hi, my name is #{name} and I'm #{options[:age]}" + " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", age: 62, city: "New York City")