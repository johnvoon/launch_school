def merge(array1, array2)
  (array1 + array2).uniq
end

def merge2(array1, array2)
  array1.concat(array2).uniq
end

def merge3(array1, array2)
  array1 | array2
end

p merge([1,3,5], [3,6,9])
p merge2([1,3,5], [3,6,9])
p merge3([1,3,5], [3,6,9])