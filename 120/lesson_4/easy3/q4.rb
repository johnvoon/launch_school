class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    puts "I am a #{type} cat"
  end
end

new_cat = Cat.new("tabby")
new_cat.to_s