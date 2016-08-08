def doubler(start) #creates a doubler method which takes a starting number parameter
  puts start #print the argument passed into start parameter of the doubler method
  if start < 10 
    doubler(start * 2) 
    #if the argument passed in is less than 10, execute the doubler method passing in the doubled version of the value stored in the start variable
    #so the doubled version gets passed into the first doubler method, which gets printed, and so on
  end
end

doubler(2)