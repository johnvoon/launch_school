class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} type of Bees Wax"
  end
end

wax = BeesWax.new("good")
p wax.describe_type
wax.type = "not good"
p wax.describe_type
