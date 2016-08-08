def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

#no output as block is not called