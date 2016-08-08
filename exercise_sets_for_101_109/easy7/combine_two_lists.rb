def interleave(array_1, array_2)
  array_1.zip(array_2).flatten
end

def interleave2(array_1, array_2)
  result = []
  array_1.each_with_index do |element, index|
    result << element << array_2[index]
  end
  result
end

p interleave([1,2,3], %w(a b c))
p interleave2([1,2,3], %w(a b c))
