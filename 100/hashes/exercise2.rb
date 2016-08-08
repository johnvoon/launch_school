method def merge_temporary
  person = {height: '6ft', weight: '160 lbs', hair: 'brown'}
  other_characteristics = {personality: 'ISFJ'}
  person.merge(other_characteristics)
  p person
end

method def merge_permanent
  person = {height: '6ft', weight: '160 lbs', hair: 'brown'}
  other_characteristics = {personality: 'ISFJ'}
  person.merge!(other_characteristics)
  p person
end

merge_temporary()
merge_permanent()