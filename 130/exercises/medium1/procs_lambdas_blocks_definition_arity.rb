# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." } # Creates a proc (not a lambda)
puts my_proc # outputs the Proc object `my_proc`
puts my_proc.class # outputs my_proc's class 
my_proc.call # Calls the my_proc proc. Procs do not enforce arity
my_proc.call('cat') # passes 'cat' as an argument into the proc.

puts "---------"

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" } # creates a lambda
my_second_lambda = -> (thing) { puts "This is a #{thing}" } #creates a lambda
puts my_lambda # outputs Proc object
puts my_second_lambda # outputs Proc object
puts my_lambda.class # outputs my_lambda's class
my_lambda.call('dog') # calls my_lambda and passes dog argument into it
my_lambda.call('cat') # calls my_lambda and passes no argument. Lambdas enforce arity
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

puts "----------"

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal') # block must be passed as argument to method

puts '--------------'

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # seal ignored as only 1 argument accepted. Implicit blocks don't enforce arity.
end
block_method_2('turtle') { puts "This is a #{animal}."} # argument not passed into block. ReferenceError

