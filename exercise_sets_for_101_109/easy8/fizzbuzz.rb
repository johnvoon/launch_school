def fizzbuzz(starting, ending)
  (1..15).each do |num|
    if num % 5 == 0 && num % 3 == 0
      puts "FizzBuzz"
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

def fizzbuzz2(starting, ending)
  result = []
  starting.upto(ending) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case 
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else 
    number
  end
end

fizzbuzz(1,15)
fizzbuzz2(1,15)