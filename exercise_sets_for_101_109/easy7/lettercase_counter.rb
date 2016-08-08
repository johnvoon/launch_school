def letter_case_count(string)
  hash = {}
  hash[:lowercase] = string.scan(/[a-z]/).count
  hash[:uppercase] = string.scan(/[A-Z]/).count
  hash[:neither] = string.scan(/[^A-Za-z]/).count
  hash
end

def letter_case_count2(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count {|char| char =~ /[a-z]/}
  counts[:uppercase] = characters.count {|char| char =~ /[A-Z]/}
  counts[:neithers] = characters.count {|char| char =~ /[^A-Za-z]/}
  counts
end

p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('123')
p letter_case_count('')
p letter_case_count2('abCdef 123')
p letter_case_count2('AbCd +Ef')
p letter_case_count2('123')
p letter_case_count2('')

