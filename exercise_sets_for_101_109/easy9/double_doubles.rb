def twice(n)
  string_num = n.to_s
  if  string_num[0..string_num.size/2 - 1] == 
      string_num[string_num.size/2..-1]
    n
  else
    n * 2
  end
end

def twice2(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

def left_side(number)
  number.to_s[0..(number.to_s.length / 2) -1]
end

def right_side(number)
  number.to_s[(number.to_s.length / 2)..-1]
end

def twice3(number)
  left_side(number) == right_side(number) ? number : number * 2
end



p twice(37)
p twice(44)
p twice(334433)
p twice(444)
p twice(107)
p twice(103103)
p twice(3333)
p twice(7676)
p twice(123_456_789_123_456_789)
p twice2(37)
p twice2(44)
p twice2(334433)
p twice2(444)
p twice2(107)
p twice2(103103)
p twice2(3333)
p twice2(7676)
p twice2(123_456_789_123_456_789)
p twice3(37)
p twice3(44)
p twice3(334433)
p twice3(444)
p twice3(107)
p twice3(103103)
p twice3(3333)
p twice3(7676)
p twice3(123_456_789_123_456_789)
