def countdown(start)
  puts start
  if start > 0
    countdown(start - 1)
  end
end

p countdown(10)