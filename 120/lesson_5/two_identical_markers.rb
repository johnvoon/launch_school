class Player
  attr_accessor :marker, :name
  attr_reader :all_moves_made

  def initialize(marker)
    @marker = marker
    @all_moves_made = []
    @name = ''
  end
end

class Computer < Player
  COMPUTER_NAMES = %w(Clueless Amateur Intelligent)

  def set_name
    puts "\nChoose who you'd like to play against:"
    COMPUTER_NAMES.each_with_index do |name, index| 
      puts "#{index + 1}. #{name} (#{name[0].downcase})"
    end

    answer = gets.chomp.downcase

    if %w(1 c clueless).include?(answer)
      self.name = "Clueless"
    elsif %w(2 a amateur).include?(answer)
      self.name = "Amateur"
    elsif %w(2 i intelligent).include?(answer)
      self.name = "Intelligent"
    end
  end
end

new_computer = Computer.new("X")
p new_computer.marker