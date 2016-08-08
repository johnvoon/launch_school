def balanced?(string)
  parens = 0
  square_brackets = 0
  curly_brackets = 0
  single_quotation = 0
  double_quotation = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    square_brackets += 1 if char == '['
    square_brackets -= 1 if char == ']'
    curly_brackets += 1 if char == '{'
    curly_brackets -= 1 if char == '}'
    single_quotation += 1 if char == %Q[']
    double_quotation += 1 if char == %Q["]
    break if parens < 0 || 
    square_brackets < 0 ||
    curly_brackets < 0
  end

  parens.zero? && 
  square_brackets.zero? &&
  curly_brackets.zero? &&
  single_quotation.even? &&
  double_quotation.even?
end

p balanced?(%Q[What ""''is this?])
p balanced?('What is) this?')
p balanced?('What (is this?')
p balanced?('((What) (is this))?')
p balanced?('((What)) (is this))')
p balanced?('Hey!')
p balanced?(')Hey!(')
p balanced?('What ((is))) up(')