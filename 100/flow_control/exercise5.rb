def number_range2(num = gets.chomp.to_i)
  case 
    when num < 0
      "#{num} is a negative number"
    when num >=0 && num <= 50
      "#{num} is between 0 and 50"
    when num >= 51 && num <= 100
      "#{num} is between 0 and 50"
    else 
      "#{num} is above 100"
    end
end

p number_range2()
