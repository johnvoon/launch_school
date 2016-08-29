array = [1, 2, 3, 4, 5]

result =  array.reduce do |accumulator, num|
            accumulator + num
          end

p result

def reduce(array, initial_value = 0)
  index = 0
  accumulator = initial_value
  while index < array.length
    accumulator = yield(accumulator, array[index])
    index += 1
  end

  accumulator
end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass