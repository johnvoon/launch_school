def toggle_lights(lights)
  1.upto(lights.size) do |round_number|
    lights.each do |position, value|
      if position % round_number == 0
        value == "off" ? lights[position] = "on" : lights[position] = "off"
      end
    end
  end
end

def display_output(lights)
  number_on = on_lights(lights).size
  list_on = on_lights(lights).join(", ")
  number_off = off_lights(lights).size
  list_off = off_lights(lights).join(", ")
  p <<-MSG
  #{number_on} lights are now on. These are lights #{list_on}. 

  The other #{number_off} lights are now off. These are #{list_off}."
  MSG
end


#calculate how many lights are on
def on_lights(lights)
  lights.keys.select { |key| lights[key] == "on" }
end

def off_lights(lights)
  lights.keys.select { |key| lights[key] == "off" }
end

lights = Hash.new
1.upto(1000) { |number| lights[number] = "off" }
toggle_lights(lights)
display_output(lights)
