class SumOfMultiples
  def self.to(limit, factors = [3, 5])
    all_multiples = []
    numbers = (1...limit).to_a
    factors.each do |factor|
      numbers.each do |number|
        all_multiples << number if number % factor == 0
      end
    end
    
    return 0 if all_multiples.empty?
    all_multiples.uniq.reduce(:+)    
  end
  
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    self.class.to(limit, @factors)
  end
end

sum_of_multiples = SumOfMultiples.new(4).to(20)
p sum_of_multiples