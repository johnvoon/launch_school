# say.rb

puts "hello"
puts "hi"
puts "how are you"
puts "I'm fine"

def say(words) #creates method called "say" which takes words (being a string) as a parameter. Arguments will be passed to the method in place of the words parameter when the method is called
  puts words + "."
end

say("hello")
say("hi")
say("how are you")
say("I'm fine")