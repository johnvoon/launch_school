def minilang(string)
  stack = []
  register = 0
  string.split.each do |token|
    case token
    when 'ADD'    then register += stack.pop
    when 'DIV'    then register /= stack.pop
    when 'MULT'   then register *= stack.pop
    when 'MOD'    then register %= stack.pop
    when 'SUB'    then register -= stack.pop
    when 'PUSH'   then stack.push(register)
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    else               register = token.to_i
    end
  end
end

def minilang2(expression)
  stack = []
  operands = []
  expression.split.each do |token|
    case token
    when /^\d+?$/
      stack.push(token.to_i)
    when "+", "-", "*", "/", "**"
      operands = stack.pop(2)
      stack.push(operands[0].send(token, operands[1]))
    end
  end
  puts evaluation
end

p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
