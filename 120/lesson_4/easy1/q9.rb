class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# self refers to the Cat class. 
# this is a class method that is shared by an objects instantiated from the Cat class
# the way to call it is Cat.cats_count