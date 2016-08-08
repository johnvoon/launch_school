# conditional_loop_with_next.rb

x = 0 #stores the value 0 to the variable x

while x <= 10 #runs loop while x is less than or equal to 10. For each iteration, increment x by 1 each time
  if x == 3 #when x is equal to 3, increment by one but skip on to the next iteration 
    x += 1
    next
  elsif x.odd? #whenever x is an odd number, print x to the screen
    puts x
  end #end the loop when the count reaches 10
  x += 1
end