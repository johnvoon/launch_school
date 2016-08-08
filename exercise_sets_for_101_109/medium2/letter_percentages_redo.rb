def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    if char == char.downcase
      puts "downcase"
    end
  end
end

