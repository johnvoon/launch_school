def initialize_light_switches(num)
  array = []
  num.times { array << 0 }
  array
end

def toggle_lights(num)
  lights = initialize_light_switches(num)
  (1..num).each do |round|
    lights.each_index do |index|
      if (index + 1) % round == 0
        lights[index] == 0 ? lights[index] = 1 : lights[index] = 0 
      end
    end
  end
  lights
end

def lights_on(array)
  lights_on_index = []
  array.each_with_index {|light, index| lights_on_index << index + 1 if light == 1}
  lights_on_index[0..-2].join(', ') + " and " + lights_on_index[-1].to_s
end

def lights_off(array)
  lights_off_index = []
  array.each_with_index {|light, index| lights_off_index << index + 1 if light == 0}
  lights_off_index[0..-2].join(', ') + " and " + lights_off_index[-1].to_s
end

final_result = toggle_lights(1000)
number_lights_on = final_result.count(1)

p final_result 
puts "#{number_lights_on} lights are on."
puts "Lights #{lights_on(toggle_lights(1000))} are now on; lights #{lights_off(toggle_lights(1000))} are off."