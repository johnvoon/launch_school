#frozen_string_literal: true

class Board
  attr_accessor :all_squares

  EMPTY_SQUARE_MARKER = ' '
  LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
          [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
          [[1, 5, 9], [3, 5, 7]]

  def initialize
    @all_squares = {}
    reset
  end

  def draw
    puts '     |     |'
    puts "  #{all_squares[1]}  |  #{all_squares[2]}  |  #{all_squares[3]}  "
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{all_squares[4]}  |  #{all_squares[5]}  |  #{all_squares[6]}  "
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{all_squares[7]}  |  #{all_squares[8]}  |  #{all_squares[9]}  "
    puts '     |     |'
  end

  def fill_with_numbers
    (1..9).each do |square_number|
      all_squares[square_number] = square_number
    end
  end

  def reset
    (1..9).each do |square_number|
      all_squares[square_number] = EMPTY_SQUARE_MARKER
    end
  end

  def []=(square_number, marker)
    all_squares[square_number] = marker
  end

  def available_squares
    all_squares.keys.select do |square_number|
      all_squares[square_number] == EMPTY_SQUARE_MARKER
    end
  end

  def full?
    available_squares.empty?
  end

  def someone_won_round?
    !!return_winning_marker
  end

  def return_winning_marker
    LINES.each do |line|
      markers_on_line = all_squares.values_at(*line)
      if three_identical_markers?(markers_on_line)
        return markers_on_line.first
      end
    end
    nil
  end

  private

  def three_identical_markers?(array_markers)
    array_markers.uniq.first != EMPTY_SQUARE_MARKER &&
    array_markers.uniq.length == 1
  end
end

class Score
  attr_accessor :human_score, :computer_score

  def initialize
    @human_score = 0
    @computer_score = 0
  end

  def reset_score
    self.human_score = 0
    self.computer_score = 0
  end

  def someone_won_match?
    human_score == 5 || computer_score == 5
  end
end

class Player
  attr_accessor :marker, :name
  attr_reader :all_moves_made

  def initialize(marker)
    @marker = marker
    @all_moves_made = []
    @name = ''
  end
end

class Human < Player
  def capitalize(name)
    name[0].upcase + name[1..-1]
  end

  def set_name
    puts "Please enter your name:"
    answer = ''
    loop do
      answer = gets.chomp
      break unless answer =~ /^$|\A\s+\z/
      puts "Please enter your name to continue."
    end
    self.name = capitalize(answer)
  end
end

class Computer < Player
  COMPUTER_NAMES = %w(Clueless Amateur).freeze

  def set_name
    puts "\nChoose who you'd like to play against:"
    list_computer_names
    answer = gets.chomp.downcase
    self.name = process(answer)
  end

  private

  def list_computer_names
    COMPUTER_NAMES.each_with_index do |name, index|
      puts "#{index + 1}. #{name} (#{name[0].downcase})"
    end
  end

  def process(answer)
    if %w(1 c clueless).include?(answer)
      "Clueless"
    elsif %w(2 a amateur).include?(answer)
      "Amateur"
    else
      puts "Not a valid choice. You'll play against the default computer."
      "Clueless"
    end
  end
end

class TTTGame
  attr_reader :board, :human, :computer
  attr_accessor :score, :round_number

  X_MARKER = 'X'.freeze
  O_MARKER = 'O'.freeze

  def initialize
    @board = Board.new
    @human = Human.new(X_MARKER)
    @computer = Computer.new(O_MARKER)
    @current_marker = ''
    @score = Score.new
    @round_number = 0
  end

  def play
    clear
    display_welcome_message
    set_human_name
    display_instructions
    set_computer_name
    display_computer_name
    assign_player_markers
    main_game_loop
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_numbered_board
    puts ''
    board.fill_with_numbers
    board.draw
    puts ''
  end

  def display_instructions
    puts "\nINSTRUCTIONS:"
    puts "Hi there #{human.name}!"
    puts ""
    puts "In this game, you'll take turns marking squares in a 3 x 3 grid:"
    display_numbered_board
    puts 'The player who succeeds in placing three of their markers '\
         'in a horizontal, vertical, or diagonal row gets a point.'
    puts "\nFirst to 5 points wins the game."
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def set_human_name
    human.set_name
  end

  def set_computer_name
    computer.set_name
  end

  def assign_player_markers
    puts "\nChoose your marker: 'O' or 'X'"
    marker_choice = gets.chomp.downcase
    if %w(x o).include?(marker_choice)
      if marker_choice == 'x'
        human.marker = X_MARKER
        computer.marker = O_MARKER
      else
        human.marker = O_MARKER
        computer.marker = X_MARKER
      end
    else
      puts  'That marker is not available. '\
            'Please wait while we assign you a marker...'
      sleep 2
    end
  end

  def main_game_loop
    loop do
      loop do
        break if score.someone_won_match?
        reset_board
        set_current_player
        players_move
        display_round_winner
        register_score
        increment_round_number
      end
      clear
      display_winner
      break unless play_again?
      reset_game
    end
  end

  def display_markers
    puts "You're using marker #{human.marker}. "\
         "#{computer.name} is using marker #{computer.marker}."
  end

  def display_board
    display_markers
    display_round_number
    display_score
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_goes_first?
    puts "\nDo you want to go first? (y/n)"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "\nSorry not a valid choice. Please enter either y or n"
    end

    answer == 'y'
  end

  def set_current_player
    @current_marker = human_goes_first? ? human.marker : computer.marker
  end

  def players_move
    loop do
      clear_screen_and_display_board
      current_player_moves
      clear_screen_and_display_board
      display_computer_move if computer_turn?
      break if board.someone_won_round? || board.full?
      switch_current_player
    end
  end

  def computer_making_move
    puts "#{computer.name} is making a move..."
    sleep 1
  end

  def current_player_moves
    if @current_marker == human.marker
      human_moves
    else
      computer_moves
      computer_making_move
    end
  end

  def switch_current_player
    @current_marker = if @current_marker == human.marker
                        computer.marker
                      else
                        human.marker
                      end
  end

  def join_list(array_available_squares)
    joined_list = ''
    array_strings = array_available_squares.map(&:to_s)
    return array_strings.first if array_strings.length == 1
    array_strings[0..-3].each do |square_number|
      joined_list << square_number.to_s + ', '
    end
    second_portion = array_strings[-2] + ' or ' + array_strings[-1]
    joined_list + second_portion
  end

  def human_moves
    puts  'Choose a square to place your marker '\
          "(#{join_list(board.available_squares)}):"
    chosen_square = nil
    loop do
      chosen_square = gets.chomp.to_i
      break if board.available_squares.include?(chosen_square)
      puts "\nSorry, please choose from the available squares."
    end

    board[chosen_square] = human.marker
  end

  def two_identical_markers?(array_markers, marker)
    board.all_squares.values_at(*array_markers).count(marker) == 2
  end

  def actionable_square(marker)
    Board::LINES.each do |line|
      if two_identical_markers?(line, marker)
        return board.all_squares.select do |square_number, square_value|
          line.include?(square_number) &&
          square_value == Board::EMPTY_SQUARE_MARKER
        end.keys.first
      end
    end
  end
  
  def amateur_computer_move
    if board.available_squares.include?(actionable_square(computer.marker))
      actionable_square(computer.marker)
    elsif board.available_squares.include?(5)
      5
    elsif board.available_squares.include?(actionable_square(human.marker))
      actionable_square(human.marker)
    else
      board.available_squares.sample
    end
  end

  def computer_moves
    if computer.name == "Clueless"
      computer_choice = board.available_squares.sample
    elsif computer.name == "Amateur"
      computer_choice = amateur_computer_move
    end

    board[computer_choice] = computer.marker
    computer.all_moves_made << computer_choice
  end

  def computer_turn?
    @current_marker == computer.marker
  end

  def display_computer_move
    puts "#{computer.name} chose square #{computer.all_moves_made.last}."
  end

  def display_round_winner
    clear_screen_and_display_board

    case board.return_winning_marker
    when human.marker
      puts "Nice one #{human.name}! You won this round!"
    when computer.marker
      puts "#{computer.name} won this round!"
    else
      puts "It's a tie!"
    end
  end

  def display_computer_name
    puts "You are now playing against #{computer.name}."
  end

  def increment_round_number
    self.round_number += 1
  end

  def reset_round_number
    self.round_number = 0
  end

  def display_round_number
    puts "\nROUND NUMBER: #{round_number}"
  end

  def register_score
    case board.return_winning_marker
    when human.marker
      score.human_score += 1
    when computer.marker
      score.computer_score += 1
    end
  end

  def display_score
    puts "\nSCORE:"
    puts "#{human.name}: #{score.human_score}  "\
         "#{computer.name}: #{score.computer_score}"
  end

  def display_winner
    if score.human_score == 5
      puts "Congratulations #{human.name}! You won the game!"
    elsif score.computer_score == 5
      puts "Nice try #{human.name}, but #{computer.name} won this time."
    end
  end

  def clear
    (system 'clear') || (system 'cls')
  end

  def play_again?
    answer = nil
    loop do
      puts "\nDo you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def reset_board
    board.reset
  end

  def reset_game
    score.reset_score
    reset_round_number
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

new_game = TTTGame.new
new_game.play
