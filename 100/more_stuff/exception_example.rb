# exception_example.rb

names = ['bob', 'joe', 'steve', nil, 'frank'] #stores an array in the variable names

names.each do |name| #for each element in the array, store value in the variable name 
  begin 
    puts "#{name}'s name has #{name.length} letters in it."
  end
end  