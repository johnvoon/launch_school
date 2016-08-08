def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

#no output as block is not called