class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# make_one_year_older is an instance method that can only be called on instances of the Cat class
# self refers to the object instantiated from the Cat class that calls this instance method

