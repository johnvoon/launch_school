def palindromic_number?(n)
  n.to_s == n.to_s.reverse
end

def palindromic_number2?(n)
  '%05d' % n.to_s.to_i == ('%05d' % n.to_s.to_i).reverse
end

p palindromic_number2?(00034543)
p palindromic_number2?(000123210)
p palindromic_number2?(00022)
p palindromic_number2?(0005000)
