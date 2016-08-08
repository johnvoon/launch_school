# value = 1
# while value <= 99
#   puts value
#   value += 2
# end

# 1.upto(99) {|n| puts n if n % 2 == 1 }

# puts (1..99).to_a.select {|n| n % 2 == 1}

1.upto(99) {|n| puts n if n.odd? }

# p (1..99).step(2).to_a