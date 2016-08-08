module Speed
  def go_fast
    puts self.class
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

new_car = Car.new
new_truck = Truck.new
new_car.go_fast
new_truck.go_fast