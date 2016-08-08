NUMBERS = {
  0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
  5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine",
  10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen",
  14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
  18 => "eighteen", 19 => "nineteen"
}

NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(array)
  alphabetic_numbers = array.map { |num| NUMBERS[num] }.sort
  alphabetic_numbers.map { |num_word| NUMBERS.key(num_word) }
end

def alphabetic_number_sort2(array)
  array.sort_by {|number| NUMBER_WORDS[number]}
end

p alphabetic_number_sort((0..19).to_a) 
p alphabetic_number_sort2((0..19).to_a) 
