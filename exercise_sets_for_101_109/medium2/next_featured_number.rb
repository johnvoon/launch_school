def featured(num)
  if num % 7 == 0
    featured_number = num
    featured_number = increment(featured_number)
  elsif num % 7 != 0
    remainder = num % 7
    featured_number = num - remainder
    featured_number = increment(featured_number)
  end
end

def increment(featured_number)
  loop do
    featured_number += 7 #increment first, break once incremented
    break if  (featured_number.odd? && 
              featured_number % 7 == 0 &&
              featured_number == featured_number.to_s.chars.uniq.join.to_i)
  end
  if featured_number <= 9_876_543_210
    featured_number
  else puts "There is no possible number that fulfills those requirements."
  end
end

p featured(12)
p featured(20)
p featured(21)
p featured(997)
p featured(1029)
p featured(999_999)
p featured(999_999_987)
# p featured(9_999_999_999)