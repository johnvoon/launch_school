BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

#short solution
def block_word?(string)
  BLOCKS.none? {|block| string.count(block) >= 2}
end

#long solution
def block_word2?(string)
  spelling_blocks = [
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], 
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']
  ]
  string.each_char do |char|
    spelling_blocks.each do |block|
      block.delete(char) if block.include?(char) 
    end    
  end
  spelling_blocks.each do |block| 
    return false if block.length == 0
  end
  true
end

p block_word?("BATCH")
p block_word?("BUTCH")
p block_word2?("BATCH")
p block_word2?("BUTCH")

