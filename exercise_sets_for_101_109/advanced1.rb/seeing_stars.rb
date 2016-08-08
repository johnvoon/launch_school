def star(n)
  upper_section = (n/2-1).downto(0) do |spaces|
    puts ('*' + (' ' * spaces) + '*' + (' ' * spaces) + '*').center(n)
  end
  puts '*' * n
  lower_section = 0.upto(n/2-1) do |spaces|
    puts ('*' + (' ' * spaces) + '*' + (' ' * spaces) + '*').center(n)
  end 
end

p star(7)
p star(9)