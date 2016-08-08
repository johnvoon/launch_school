def substring(string, start_index, end_index = start_index)
  string[start_index..end_index]
end

p substring("honey", 0, 2)
p substring("honey", 1, 2)
p substring("honey", 3, 9)
p substring("honey", 2)
