greetings = { a: 'hi' } # hash object
informal_greeting = greetings[:a] # 'hi' string
informal_greeting << ' there' # adds to 'hi' string

puts informal_greeting  #  => "hi there"
puts greetings # hash object

# informal_greeting is a reference to the original hash object
# informal_greeting << ' there' was using the String#<< method, which modifies the caller object
# Therefore, original object changed, impacting the greetings variable
# to modify only informal_greeting, not greetings: 

informal_greeting = greetings[:a].clone # reference to new object containing same value
informal_greeting = informal_greeting + ' there' #string concatenation