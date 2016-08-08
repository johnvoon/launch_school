def print_in_box(string)
  space = "|" + ' ' * (string.length + 2) + "|"
  top_bottom_line = "+" + '-' * (string.length + 2) + '+'
  
  puts top_bottom_line
  puts space
  puts "|" + string.center(string.length + 2) + "|"
  puts space
  puts top_bottom_line
end

p print_in_box("To boldly go where no one has gone before")