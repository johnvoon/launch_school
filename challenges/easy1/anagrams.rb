class Anagram
  def initialize(word)
    @word = split(word)
    @letters = @word.sort
  end

  def match(candidates)
    matches = []
    candidates.each do |candidate|
      next if split(candidate) == @word
      matches << candidate if split(candidate).sort == @letters
    end

    matches
  end

  private

  def split(word)
    word.downcase.chars
  end
end
