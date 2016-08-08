person = {name: "John", height: "160cm", nationality: "Australian"}
person.each_key {|key| puts key }
person.each_value {|value| puts value }
person.each {|key, value| puts "#{key} is #{value}"}