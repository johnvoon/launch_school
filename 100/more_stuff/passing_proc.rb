#passing_proc.rb

def take_proc(proc) #defines new method take_proc which takes a proc as an argument
  [1,2,3,4,5].each do |number| # for each element in the array, save it to the variable number
    proc.call number #calls the proc and passes in each element of the array
  end
end

proc = Proc.new do |number| 
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)