# iterating_over_hashes.rb

person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'} #saves a new hash to person variable

person.each do |key, value| #for each element in the hash, print key and value in this sentence
  puts "Bob's #{key} is #{value}"
end
