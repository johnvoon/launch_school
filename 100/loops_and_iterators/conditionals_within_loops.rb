#conditionals_within_loops.rb

x = 0 #stores the value 0 to the variable x

while x <= 10 #runs a while loop as long as x is less than 10 
  if x.odd? #if x is an odd number, print x
    puts x
  end 
  x += 1 #increment x by 1 for each loop
end