def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3)/3
  case 
  when average >= 90 && average <= 100
    "A"
  when average >= 80 && average < 90
    "B"
  when average >= 70 && average < 80
    "C"
  when average >= 60 && average < 70
    "D"
  else "F"
  end
end

def get_grade2(score1, score2, score3)
  average = (score1 + score2 + score3)/3
  case average
  when 90..100  then  'A' 
  when 80..89   then  'B'
  when 70..79   then  'C'
  when 60..69   then  'D'
  else                'F'
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95)
p get_grade2(95, 90, 93)
p get_grade2(50, 50, 95)
