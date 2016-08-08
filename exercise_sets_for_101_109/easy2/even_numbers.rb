1.upto(99) {|n| puts n if n.even? }
1.upto(99) {|n| puts n if n % 2 == 0}
puts (1..99).to_a.select {|n| n % 2 == 0}

value = 1
while value <= 99
  puts vlaue if value.even?
  value += 1
end
