def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end
  result
end

def staggered_case2(string, first_char_upcase:)
  result = ''
  need_upper = first_char_upcase
  string.chars.each do |char|
    if need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case("I Love Launch School")
p staggered_case("ALL_CAPS")
p staggered_case("ignore 77 the 444 numbers")
p staggered_case2("I Love Launch School", first_char_upcase: true)
p staggered_case2("ALL_CAPS", first_char_upcase: false)
p staggered_case2("ignore 77 the 444 numbers", first_char_upcase: true)
