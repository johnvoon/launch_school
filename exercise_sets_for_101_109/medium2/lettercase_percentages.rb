def lettercase_percentages(string)
  percentages = {}
  percentages[:lowercase] = (string.count("a-z").to_f / string.length * 100).round(2)
  percentages[:uppercase] = (string.count("A-Z").to_f / string.length * 100).round(2)
  percentages[:neither] = (string.count("^a-zA-Z").to_f / string.length * 100).round(2)
  percentages
end

def lettercase_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0}
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count {|char| char =~ /[A-Z]/}
  counts[:lowercase] = characters.count {|char| char =~ /[a-z]/}
  counts[:neither] = characters.count {|char| char =~ /[^A-Za-z]/}

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

p lettercase_percentages("abCdef 123")
p lettercase_percentages("AbCd +Ef")
p lettercase_percentages("123")

