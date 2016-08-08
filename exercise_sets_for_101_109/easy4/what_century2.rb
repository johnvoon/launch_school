def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return "th" if [11,12,13].include? century/100
  last_digit = century % 100
  case last_digit
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)
p century(1052)
p century(1127)
p century(11201)