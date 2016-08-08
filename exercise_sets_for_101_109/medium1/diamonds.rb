def diamond(n)
  1.upto(n/2) {|count| puts ("*" * (count * 2 - 1)).center(n)}
  puts "*" * n
  (n/2).downto(1) {|count| puts ("*" * (count * 2 - 1)).center(n)}
end

def diamond2(n)
  puts "*".center(n)
  2.upto(n/2) {|count| puts ("*" + ' ' * (count*2-3) + "*").center(n)}
  puts "*" + ' ' * (n - 2) + "*"
  (n/2).downto(2) {|count| puts ("*" + ' ' * (count*2-3) + "*").center(n)}
  puts "*".center(n)
end

diamond(9)
diamond2(9)