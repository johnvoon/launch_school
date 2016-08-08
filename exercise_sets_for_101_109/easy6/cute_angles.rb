DEGREE = "\xC2\xB0"

def dms(degrees_float)
  if degrees_float >= 0
    total_seconds = (degrees_float * 3600).round
    degrees, remaining_seconds = total_seconds.divmod(3600)
    minutes, seconds = remaining_seconds.divmod(60)
    format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  else
    total_seconds = (-degrees_float * 3600).round
    degrees, remaining_seconds = total_seconds.divmod(3600)
    minutes, seconds = remaining_seconds.divmod(60)
    format(%(-#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  end
end

p dms(30)
p dms(76.73)
p dms(254.6)
p dms(93.034773)
p dms(0)
p dms(360)
p dms(-30)
p dms(-76.73)
p dms(-254.6)
p dms(-93.034773)
p dms(0)
p dms(-360)
