class Bag
  attr_accessor :color, :material
  def initialize(color, material)
    @color = color
    @material = material
  end
end

new_bag = Bag.new("red", "nylon")
p new_bag.color
p new_bag.material