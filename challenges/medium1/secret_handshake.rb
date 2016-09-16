class SecretHandshake
  def initialize(handshake)
    @binary_string =  if handshake == handshake.to_s
                        handshake
                      elsif handshake == handshake.to_i
                        handshake.to_s(2)
                      end
    @commands = []
  end

  def commands
    reverse_binary_string = @binary_string.chars.reverse
    reverse_binary_string.each_index do |index|
      if reverse_binary_string[index] == "1"
        case index
        when 0
          @commands << "wink"
        when 1
          @commands << "double blink"
        when 2
          @commands << "close your eyes"
        when 3
          @commands << "jump"
        when 4
          @commands.reverse!
        end
      end
    end

    @commands
  end
end

handshake = SecretHandshake.new("11001")
p handshake.commands