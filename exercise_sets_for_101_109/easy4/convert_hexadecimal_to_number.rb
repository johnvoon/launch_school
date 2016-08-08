HEX = { '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8,
        '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12,
        'D' => 13, 'E' => 14, 'F' => 15}

def hexadecimal_to_integer(hex)
  array = hex.chars.map { |char| HEX[char] }
  power = 0
  array_convert = array.map do |n|
    n * (16**power += 1)
  end
  array_convert
end

p hexadecimal_to_integer('ABC')
  # sum = 0
  # array_convert.each { |n| sum += n }
