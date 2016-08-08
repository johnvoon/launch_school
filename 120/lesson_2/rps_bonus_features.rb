class Move
  MOVES = {
    'r' => 'rock',
    'p' => 'paper',
    'x' => 'scissors',
    'l' => 'lizard', 
    's' => 'spock'
  }.freeze

  WINNING_VERBS = {
    'rock' => { 'scissors' => 'breaks',
                'lizard' => 'smashes' },
    'paper' => { 'rock' => 'covers',
                 'lizard' => 'smashes' },
    'scissors' => { 'paper' => 'cuts',
                    'lizard' => 'slices' },
    'lizard' => { 'spock' => 'poisons',
                  'paper' => 'eats' },
    'spock' => { 'rock' => 'vaporizes',
                 'scissors' => 'crushes' },
  }.freeze

  attr_reader :value

  def initialize(choice)
    @value = Move.return_move(choice)
  end

  def self.return_move(choice)
    if MOVES.keys.include?(choice)
      MOVES[choice[0]]
    elsif MOVES.values.include?(choice)
      choice
    end
  end

  def self.valid?(choice)
    MOVES.values.include?(choice) ||
    MOVES.keys.include?(choice)
  end

  def self.list_moves
    MOVES.values
  end

  def self.losing_moves(choice)
    MOVES[choice].keys
  end

  def >(other_move)
    self != other_move &&
      Move.losing_moves(value).include?(other_move.value)
  end

  def ==(other_move)
    value == other_move.value
  end

  def <(other_move)
    !(self > other_move || self == other_move)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name
end

class Human < Player
  def initialize
    @name = 'Player'
  end

  def set_name
    n = ""
    loop do
      puts "\nWhat's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n[0].upcase + n[1..-1]
  end

  def choose
    choice = nil
    loop do
      RPSGame.display_choices
      choice = gets.chomp.downcase
      break if Move.valid?(choice)
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
    self.move = Move.new(Move::MOVES.values.sample)
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
  end

  def self.display_choices
    puts "\nPlease choose a move:"
    Move::MOVES.each do |short_form, long_form|
      puts "  #{long_form} (#{short_form})"
    end
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

  def self.display_score
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
    human.set_name

    loop do
      human.choose
      computer.choose
      display_moves
      display_round_winner
      register_score
      display_score
      if self.score[:human] == 10 || self.score[:computer] == 10
        display_game_winner
        reset_score
        break unless play_again?
      end
    end
    
    display_goodbye_message

  end
end

RPSGame.new.play
