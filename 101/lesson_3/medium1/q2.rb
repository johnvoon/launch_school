statement = "The Flintstones Rock"
keys = statement.split("")
letter_frequency = {}

# iterate keys
# create new hash element with count if element does not yet exist
# if already exists, add 1 to hash element

keys.each do |key|
    letter_frequency[key] = keys.count(key)
end

p letter_frequency