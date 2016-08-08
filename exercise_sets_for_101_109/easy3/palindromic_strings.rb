def palindrome?(str)
  str == str.reverse
end

def arr_palindrome?(arr)
  arr == arr.reverse
end

def strarr_palindrome?(input)
  input == input.reverse
end

p palindrome?("madam")
p palindrome?("Madam")
p palindrome?("madam i'm adam")
p palindrome?("356653")
p arr_palindrome?([1,2,3,4,5])
p arr_palindrome?([1,2,3,2,1])
p strarr_palindrome?([1,2,3,4,5])
p strarr_palindrome?([1,2,3,2,1])
p strarr_palindrome?("Madam")
p strarr_palindrome?("madam")
