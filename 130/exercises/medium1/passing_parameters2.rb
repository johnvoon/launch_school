def filter(birds)
  yield(birds)
end

birds = %w(raven finch hawk eagle)

filter(birds) do |_, _, *birds_of_prey|
  puts "Two birds of prey are the #{birds_of_prey.join(" and ")}"
end