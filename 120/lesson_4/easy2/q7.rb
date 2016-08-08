class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
    puts @@cats_count
  end

  def self.cats_count
    @@cats_count
  end
end

# @@cats_count keeps track of the number of times the Cat object was instantiated. 
# in other words, it keeps track of how many Cat objects there are

Cat.new('tabby')
Cat.new('russian blue')
Cat.new('shorthair')