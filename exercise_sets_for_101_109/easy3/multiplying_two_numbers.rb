def multiply(first, second)
  answer = first.to_f * second.to_f
  answer.round(100)
end

p multiply(5.22, 3)