require 'date'

def friday_13th?(year)
  days_in_year = Date.new(year).step(Date.new(year, -1, -1))
  fridays = days_in_year.select {|d| d.friday? && d.day == 13}.size
end

def friday_13th_v2(year)
  unlucky_days = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_days += 1 if thirteenth.friday?
    thirteenth = thirteenth >> 1
  end

  unlucky_days
end

def sevenths(year)
  seventh_days = {}
  1.upto(12) do |month| 
    seventh_days[Date::ABBR_MONTHNAMES[month]] = ''
  end

  seventh = Date.new(year, 1, 7)
  seventh_days.each do |month,_|
    seventh_days[month] = Date::DAYNAMES[seventh.wday]
    seventh = seventh >> 1
  end
end

def second_to_lasts(year)
  second_to_last_days = {}
  1.upto(12) do |month|
    second_to_last_days[Date::ABBR_MONTHNAMES[month]] = ''
  end

  second_to_last = Date.new(year, 1, -2)
    second_to_last_days.each do |month,_|
    second_to_last_days[month] = Date::DAYNAMES[second_to_last.wday]
    second_to_last >> 1
  end
end

# p friday_13th?(2015)
# p friday_13th?(1986)
# p friday_13th_v2(2015)
# p friday_13th_v2(1986)
# p friday_13th_v2(2017)
# p sevenths(2015)
p second_to_lasts(2015)

