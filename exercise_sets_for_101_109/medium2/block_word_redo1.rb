SPELLING_BLOCKS = %w(BO, XK, DQ, CP, NA, GT, RE, FS, JW, HU, VI, LY, ZM)

def block_word?(string)
  SPELLING_BLOCKS.each {|block| return false if string.count(block) >= 2}
  true
end

def block_word?(string)
  SPELLING_BLOCKS.none? {|block| string.count(block) >= 2}
end

p block_word?('BATCH') # if none of the arrays have 2 matches to the string, return true
p block_word?('BUTCH') # if even one array has 2 matches to the string, return false 

