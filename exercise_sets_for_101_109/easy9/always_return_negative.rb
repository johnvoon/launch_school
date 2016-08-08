def negative(n)
  n > 0 ? -n : n
end

def negative2(n)
  -n.abs
end

p negative(5)
p negative(-3)
p negative(0)
p negative2(5)
p negative2(-3)
p negative2(0)