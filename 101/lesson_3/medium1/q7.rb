def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# the variable limit is not visible in the scope of fib because fib is a method and does not have access to local variables outside of its scope. You could make limit an additional argument to the definition of the fib method and pass it in when you call fib.
