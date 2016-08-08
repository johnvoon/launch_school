print "What is your name?"
name = gets.chomp

if name.include?("!")
  name = name.chop
  print "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  print "Hello #{name}."
end