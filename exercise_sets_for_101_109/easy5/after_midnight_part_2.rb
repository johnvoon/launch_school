require 'time'

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(str)
  str[0..1].to_i * MINUTES_PER_HOUR + str[3..4].to_i 
end

def before_midnight(str)
  if (str[0..1].to_i && str[3..4].to_i) == 0
    0
  elsif str[3..4].to_i == 0
    (24 - str[0..1].to_i) * MINUTES_PER_HOUR
  else
    (23 - str[0..1].to_i) * MINUTES_PER_HOUR +
    (MINUTES_PER_HOUR - str[3..4].to_i)
  end
end

def after_midnight2(str)
  hours, minutes = str.split(':').map(&:to_i)
  hours * MINUTES_PER_HOUR + minutes
end

def before_midnight2(str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

def after_midnight3(str)
  (Time.parse(str) - Time.parse('00:00')).to_i / 60
end

def before_midnight3(str)
  delta_minutes = MINUTES_PER_DAY - after_midnight3(str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34')
p before_midnight('12:34')
p after_midnight2('00:00')
p before_midnight2('00:00')
p after_midnight2('12:34')
p before_midnight2('12:34')
p after_midnight3('00:00')
p before_midnight3('00:00')
p after_midnight3('12:34')
p before_midnight3('12:34')