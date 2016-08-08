flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
first_three = flintstones.map do |name|
  name[0..2]
end

p first_three