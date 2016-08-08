def leap_year?(year)
  if year < 1752
    return true if year % 4 == 0
  end
  if year >= 1752
    return true if year % 4 == 0 && !(year % 100 == 0)
    return true if year % 400 == 0
    false
  end
end

def leap_year2?(year)
  if year < 1752 && year % 4 == 0
    true
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else 
    year % 4 == 0
  end
end
