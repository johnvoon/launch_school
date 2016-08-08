def triangle(n)
  stars = 1
  while stars <= n
    puts ("*" * stars).rjust(n)
    stars += 1
  end
end

def triangle2(n)
  stars = n
  while stars >= 1
    puts ("*" * stars).rjust(n)
    stars -= 1
  end
end

def triangle3(num)
  spaces = num - 1
  stars = 1

  num.times do
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end  
end


def triangle4(num)
  spaces = 0
  stars = num

  num.times do
    puts (' ' * spaces) + ('*' * stars)
    spaces += 1
    stars -= 1
  end  
end

def triangle5(n)
  stars = n
  while stars >= 1
    puts ("*" * stars)
    stars -= 1
  end
end

def triangle6(n)
  stars = 1
  while stars <= n
    puts ("*" * stars)
    stars += 1
  end
end

triangle(9)
triangle2(9)
triangle3(9)
triangle4(9)
triangle5(9)
triangle6(9)