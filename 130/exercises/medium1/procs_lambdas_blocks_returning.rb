# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

puts "---------------"

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

# check_return_with_proc_2(my_proc)

puts '---------------'

# Group 5
def block_method_3
  yield
end

block_method_3 { return }