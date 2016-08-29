# class Sieve
#   attr_accessor :range, :limit

#   def initialize(limit)
#     raise(ArgumentError, "There are no primes below 2!") if num < 2
#     @range = (2..limit).to_a
#     @limit = limit
#   end

#   def primes
#     0.upto(Math.sqrt(limit)) do |index|
#       self.range = range.reject do |number|
#         next if number == range[index]
#         number % range[index] == 0
#       end
#     end
    
#     range
#   end
# end

class Sieve
  def initialize(limit)
    raise(ArgumentError, "There are no primes below 2!") if limit < 2
    @range = (2..limit).to_a
    @primes = []
  end

  def primes
    until @range.empty? 
      next_prime = @range.shift
      @primes << next_prime
      @range.reject! { |num| num % next_prime == 0}
    end
    
    @primes
  end
end
