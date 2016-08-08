def staggered_case(string, count_non_alphabetic:)
  result = ''
  need_upper = true
  count_non_alphabetic = true 
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result << char.upcase
      else
        result << char.downcase
      end
      need_upper = !need_upper
    else
      result << char
    end
  end
  result
end

p staggered_case('I Love Launch School!', first_char_upcase: true)