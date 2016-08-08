def oddities(arr)
  arr.select { |obj| arr.index(obj).even? }
end

def oddities2(arr)
  odd_element = []
  index = 0
  while index < arr.length
    odd_element << arr[index]
    index += 2
  end
  odd_element
end

def evenies(arr)
  odd_element = []
  index = 1
  while index < arr.length
    odd_element << arr[index]
    index += 2
  end
  odd_element
end

def evenies2(arr)
  arr.select { |obj| arr.index(obj).odd? }
end

p oddities([2,3,4,5,6,7])
p evenies([2,3,4,5,6,7])
p oddities2([2,3,4,5,6,7])
p evenies2([2,3,4,5,6,7])
