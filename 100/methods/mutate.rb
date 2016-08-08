# Example of a method that modifies its argument permanently
# mutuate.rb

a = [1, 2, 3]

def mutate(array)
  array.pop #removes the last element of the array and returns it where it gets called from
end

p "Before mutate method executed: #{a}" #before the mutate method was executed, there is no change to the array
mutate(a)
p "After mutate method executed: #{a}" #after the mutate method was executed, there was a permanent change to the array

def no_mutate(array)
  array.last #returns the last element of the array but does not actually permanently modify the array in any way
end

p "Before no_mutate method: #{a}" 
p no_mutate(a) #method called and array is passed in as an argument to the method
p "After no_mutate method: #{a}"

