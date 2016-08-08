def time_of_day(minutes)
  delta_minutes = minutes % 1440
  hours, minutes = delta_minutes.divmod(60)
  "%02d:%02d" % [hours, minutes]
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)
