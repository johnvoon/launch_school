def triangle(side1, side2, side3)
  case
  when  (side1 + side2 <= side3) || 
        (side1 + side3 <= side2) ||
        (side2 + side3 <= side1) ||
        (side1 <= 0 || side2 <= 0 || side3 <= 0)
    :invalid
  when side1 == side2 && side1 == side3
    :equilateral
  when  (side1 == side2 && side1 != side3) || 
        (side1 == side3 && side1 != side2) ||
        (side2 == side3 && side2 != side1)
    :isosceles
  when side1 != side2 && side1 != side3 && side2 != side3
    :scalene
  end
end

p triangle(1,1,3)
p triangle(1,2,4)
p triangle(4,1,2)
p triangle(1,3,1)
p triangle(0,1,3)
p triangle(1,0,3)
p triangle(1,1,0)
p triangle(2,3,4)
p triangle(5,2,3)
p triangle(2,2,2)
p triangle(3,4,5)
p triangle(2,2,4)
p triangle(1,0,3)
p triangle(6,2,4)