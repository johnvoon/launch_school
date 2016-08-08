def minilang(string)
  stack = []
  register = 0

  string.split.each do |token|
    case token
    when /[0-9]/ then register = token.to_i
    when 'PRINT' then puts register
    when 'PUSH' then stack << register
    when 'ADD' then register += stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register = register / stack.pop
    when 'SUB' then register -= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    end 
  end
end

# minilang("PRINT")
# minilang("5 PUSH PRINT")
# minilang("5 PUSH 3 MULT PRINT")
# minilang("5 PRINT PUSH 3 PRINT ADD PRINT")
# minilang("5 PUSH POP PRINT")
# minilang("3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT")
# minilang('3 PUSH PUSH 7 DIV MULT PRINT')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')
minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
  # 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB PUSH