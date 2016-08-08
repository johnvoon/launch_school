# conditional_loop_with_break.rb

x = 0 #first stores the value x to 0, which means the loop should start at 0

while x <= 10 #run the loop only up till 10
  if x == 7 #if x is equal to 7, do not print x to the screen but exit the loop
    break
  elsif x.odd? #whenever x is an odd number, print x to the screen
    puts x
  end
  x += 1 
end