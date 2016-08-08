BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  BLOCKS.each_index do |index|
    return false if string.count(BLOCKS[index]) == 2
  end
  true
end

p block_word?("BATCH")
p block_word?("BUTCH")