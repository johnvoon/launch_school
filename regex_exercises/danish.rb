def danish(str)
  str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

p danish('An apple a day keeps the doctor away')
p danish('My favorite is blueberry pie')
p danish('The cherry of my eye')
p danish('apple. cherry. blueberry.')
p danish('I love pineapple')