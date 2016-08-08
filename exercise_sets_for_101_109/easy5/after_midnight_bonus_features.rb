require 'date'

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes) # delta_minutes is the number of minutes to wind the clock backwards or forwards
  delta_minutes = delta_minutes % MINUTES_PER_DAY # i.e. 1440. Let's say delta_minutes is 1440
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes) # return the hours and minutes in 00:00 format
end

def time_of_day2(minutes)
  delta_minutes = minutes * 60
  new_time = Time.new(2016, 7, 10, 0, 0, 0) + delta_minutes
  new_time.strftime("%A %H:%M")
end

p time_of_day(-67)
p time_of_day2(-4231)
