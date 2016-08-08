def center_of(string)
  if string.size.odd? 
    string[string.size/2]
  else 
    string[string.size/2 - 1, 2]
  end
end

p center_of("I love ruby")
p center_of("Launch School")
p center_of("Launch")
p center_ofs("Launchschool")
p center_of("x")

