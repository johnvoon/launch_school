def remove_vowels(array)
  array.map {|str| str.delete "aeiouAEIOU" }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white))
p remove_vowels(%w(ABC AEIOU XYZ))