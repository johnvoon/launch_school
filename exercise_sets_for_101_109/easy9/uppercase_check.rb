def uppercase?(string)
  unless string == ''
    return true if string == string.upcase
  end
  false
end

p uppercase?('t')
p uppercase?('T')
p uppercase?('Four Score')
p uppercase?('FOUR SCORE')
p uppercase?('4SCORE!')
p uppercase?('')
