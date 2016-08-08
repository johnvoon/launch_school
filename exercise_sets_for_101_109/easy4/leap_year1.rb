def leap_year?(year)
  return true if year % 4 == 0 && !(year % 100 == 0)
  return true if year % 400 == 0
  false
end

def leap_year2?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        true
      else false
      end
    else true
    end
  else false
  end
end


p leap_year?(2016)
p leap_year?(2015)
p leap_year?(2100)
p leap_year?(2400)
p leap_year?(240000)
p leap_year?(240001)
p leap_year?(2000)
p leap_year?(1900)
p leap_year?(1752)
p leap_year?(1700)
p leap_year?(1)
p leap_year?(100)
p leap_year?(400)
p "--------"
p leap_year2?(2016)
p leap_year2?(2015)
p leap_year2?(2100)
p leap_year2?(2400)
p leap_year2?(240000)
p leap_year2?(240001)
p leap_year2?(2000)
p leap_year2?(1900)
p leap_year2?(1752)
p leap_year2?(1700)
p leap_year2?(1)
p leap_year2?(100)
p leap_year2?(400)