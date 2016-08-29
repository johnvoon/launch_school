require 'pry'

# class Series
#   attr_reader :digits

#   def initialize(digit_string)
#     @digits = digit_string.chars.map(&:to_i)
#   end

#   def slices(slice_length)
#     slices = []
#     raise ArgumentError, "Slice length is larger than digit string length" if slice_length > digits.length
#     digits.each_index do |index|
#       slice = digits[index, slice_length]
#       slices << slice if slice.count == slice_length
#     end
#     slices
#   end
# end

class Series
  attr_reader :digits

  def initialize(digit_string)
    @digits = digit_string.chars.map(&:to_i)
  end

  def slices(slice_length)
    raise ArgumentError, "Slice length is larger than digit string length" if slice_length > digits.length
    digits.each_cons(slice_length).to_a
  end
end