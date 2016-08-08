def titleize(string)
  string.split.map { |word| word.capitalize }.join(" ")
end

p titleize("Hello how are you")

