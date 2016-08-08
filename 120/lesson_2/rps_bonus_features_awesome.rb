# frozen_string_literal: true

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.scissors)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def initialize
    @name = 'Player'
  end

  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a name."
    end
    self.name = n[0].upcase + n[1..-1].downcase #capitalizes first letter
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = {human: 0, computer: 0}
  end

  def clear_screen
    system("clear")
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts ""
  end

  def onetime_initialization
    human.set_name
    initialize_log
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won"
    else
      puts "It's a tie!"
    end
  end

  def register_score
    if human.move > computer.move
      self.score[:human] += 1
    elsif human.move < computer.move
      self.score[:computer] += 1
    end
  end

  def display_score
    puts "#{human.name}: #{self.score[:human]}; #{computer.name}: #{self.score[:computer]}"
  end

  def display_game_winner
    if self.score[:human] == 10
      puts "Congratulations, YOU WON!"
    elsif self.score[:computer] == 10
      puts "#{computer.name} won. Better luck next time!"
    end
  end
  
  def reset_score
    self.score[:human] = 0
    self.score[:computer] = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Please input y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message
    onetime_initialization
    display_instructions
    play_matches
    display_strategies
    display_goodbye_message
  end
end

RPSGame.new.play
