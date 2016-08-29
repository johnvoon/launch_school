class Trinary
  BASE = 3
  
  attr_reader :trinary_string

  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    decimal = 0

    return 0 if trinary_string =~ /[^0-2]/

    trinary_string.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (BASE ** index) 
    end

    decimal
  end
end