def sequence(count, first_num)
  result = []
  1.upto(count) {|counter| result << first_num * counter}
  result
end

def sequence(count, first_num)
  (1..count).map {|index| index * first_num}
end

p sequence(5,1)
p sequence(4, -7)
p sequence(3, 0)
p sequence(0, 1000000)