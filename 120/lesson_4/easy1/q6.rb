class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

big_cube = Cube.new(5000)
p big_cube.instance_variable_get("@volume")
p big_cube.get_volume
p big_cube.volume
p big_cube.to_s # default to_s prints object's class and encoding of the object id
