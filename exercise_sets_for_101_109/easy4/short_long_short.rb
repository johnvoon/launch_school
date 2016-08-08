def short_long_short(str1, str2)
  arr = [str1, str2]
  short = arr.min_by {|str| str.length }
  long = arr.max_by {|str| str.length }
  new_string = short + long + short
end

def short_long_short2(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
end

def short_long_short3(string1, string2)
  arr = [string1, string2].sort_by {|el| el.length }
  arr.first + arr.last + arr.first
end

p short_long_short("hello", "how")

