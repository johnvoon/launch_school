def infix_to_postfix(expression)
  precedence = {
    '*' => 3, '/' => 3, '%' => 3, '+' => 2, '-' => 2, '(' => 1
  }
  operator_stack = []
  postfix = []

  expression.each_char do |token|
    case token 
    when /[0-9]/ then postfix << token
    when '(' then operator_stack << token
    when '+', '*', '-', '/', '%'
      finished = false
      until finished or operator_stack.empty?
        if precedence[token] > precedence[operator_stack.last]
          finished = true
        else
          postfix << operator_stack.pop
        end
      end
      operator_stack << token
    when ')' 
      while operator_stack.last != '('
        postfix << operator_stack.pop
      end
      operator_stack.pop
    end
  end

  while !operator_stack.empty?
    postfix << operator_stack.pop
  end

  postfix.join
end

def minilang(expression)
  postfix_expression = infix_to_postfix(expression)
  stack = []

  postfix_expression.each_char do |token|
    case token
    when /[0-9]/  then stack << token.to_i
    when '+'      then stack << stack.pop(2).reduce(:+)
    when '*'      then stack << stack.pop(2).reduce(:*)
    when '-'      then stack << stack.pop(2).reduce(:-)
    when '/'      then stack << stack.pop(2).reduce(:/)
    when '%'      then stack << stack.pop(2).reduce(:%)
    end
  end
  puts stack
end

# minilang('4*(3 + 4)*(5-4)')
p minilang('(3+(2*5)-7)/(5%3)')