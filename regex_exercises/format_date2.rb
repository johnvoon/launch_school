def format_date2(date)
  date.sub(/\A(\d{4})([\-\/])(\d{2})\2(\d{2})\z/, '\4.\3.\1')
end

p format_date2('2016-06-17')
p format_date2('2017/05/03')
p format_date2('2015/01-31')