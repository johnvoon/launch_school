def triangle(angle1, angle2, angle3)
  case 
  when  (angle1 + angle2 + angle3 != 180) ||
        (angle1 == 0 || angle2 == 0 || angle3 == 0)
    :invalid
  when angle1 == 90 || angle2 == 90 || angle3 == 90
    :right
  when angle1 < 90 && angle2 < 90 && angle3 < 90
    :acute
  when angle1 > 90 || angle2 > 90 || angle3 > 90
    :obtuse
  end
end

p triangle(60, 70, 50)
p triangle(30, 90, 60)
p triangle(120, 50, 10)
p triangle(0, 90, 90)
p triangle(50, 50, 50)