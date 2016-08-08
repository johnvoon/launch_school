def swap_name(string)
  firstname, lastname = string.split
  "#{lastname}, #{firstname}"
end

def swap_name2(string)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts')