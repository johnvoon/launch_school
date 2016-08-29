class Octal
  BASE = 8
  
  attr_reader :octal_string

  def initialize(octal_string)
    @octal_string = octal_string
  end
  
  def to_decimal
    decimal = 0
    return 0 if octal_string =~ /[^0-7]/
    
    octal_string.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (BASE ** index)
    end 
    
    decimal
  end
end