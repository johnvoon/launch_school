class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1 # self is reference the setter method provided by attr_accessor. We could replace 'self' with @
  end
end

new_cat = Cat.new("barbarian")
p new_cat.make_one_year_older