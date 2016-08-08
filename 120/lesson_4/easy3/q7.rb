class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end

# return keyword is superfluous. There is no need to explicitly return it and it will be automatically returned by the method upon invocation even without the return keyword as it is the last line of the method. 
# We can alter brightness and color outside the Light class. 