def xor?(statement1, statement2)
  if statement1 && statement2
    false
  elsif statement1 || statement2
    true
  else false
  end
end

def xor2?(statement1, statement2)
  return true if statement1 && !statement2
  return true if statement2 && !statement1
  false
end

def xor2?(statement1, statement2)
  (statement1 && !statement2) || (statement2 && !statement1)
end

p xor2?(5.even?, 4.even?)
p xor2?(5.odd?, 4.odd?)
p xor2?(5.odd?, 4.even?)
p xor2?(5.even?, 4.odd?)
