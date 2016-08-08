fruits = ["Love", "Joy", "Peace", "Patience", "Kindness", "Goodness", "Faithfulness", "Gentleness", "Self Control"]

fruits.each_with_index do |fruit, index|
  puts "#{index + 1}. #{fruit}"
end