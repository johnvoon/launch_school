items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*vegetables, produce|
  puts vegetables.join(', ')
  puts produce
end

gather(items) do |item, *vegetables, item2|
  puts item
  puts vegetables.join(', ')
  puts item2
end

gather(items) do |fruit, *produce|
  puts fruit
  puts produce.join(', ')
end

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage} and #{wheat}"
end