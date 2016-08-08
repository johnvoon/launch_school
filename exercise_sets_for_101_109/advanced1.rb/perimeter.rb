def perimeter(n)
  fibonacci = [1, 1]
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
    fibonacci << first + last
  end
  fibonacci
end