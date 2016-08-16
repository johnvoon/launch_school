require 'pry'

class Board
  LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
          [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
          [[1, 5, 9], [3, 5, 7]]

  def initialize
    @all_squares = {}
    reset
  end

  def draw
    puts ''
    puts '     |     |'
    puts "  #{@all_squares[1]}  |  #{@all_squares[2]}  |  #{@all_squares[3]}  "
    puts '     |     |'
    puts "-----+-----+-----"
    puts '     |     |'
    puts "  #{@all_squares[4]}  |  #{@all_squares[5]}  |  #{@all_squares[6]}  "
    puts '     |     |'
    puts "-----+-----+-----"
    puts '     |     |'
    puts "  #{@all_squares[7]}  |  #{@all_squares[8]}  |  #{@all_squares[9]}  "
    puts '     |     |'
    puts ''
  end

  def reset
    (1..9).each do |square_number|
      @all_squares[square_number] = square_number
    end
  end

  def []=(square_number, marker)
    @all_squares[square_number] = marker
  end

  def available_squares
    @all_squares.keys.select do |square_number|
      @all_squares[square_number] == @all_squares[square_number].to_i
    end
  end

  def full?
    available_squares.empty?
  end

  def someone_won?
    !!return_winning_marker
  end

  def return_winning_marker
    LINES.each do |line|
      markers_on_line = @all_squares.values_at(*line)
      if three_identical_markers?(markers_on_line)
        return markers_on_line.first
      end
    end
    nil
  end

  private

  def three_identical_markers?(array_markers)
    array_markers.uniq.length == 1
  end
end

class Player
  attr_accessor :marker
  attr_reader :all_moves_made

  def initialize(marker)
    @marker = marker
    @all_moves_made = []
  end
end

class TTTGame
  attr_reader :board, :human, :computer
  X_MARKER = 'X'
  O_MARKER = 'O'

  def initialize
    @board = Board.new
    @human = Player.new(X_MARKER)
    @computer = Player.new(O_MARKER)
    @current_marker = ''
  end

  def play
    clear
    display_welcome_message

    loop do
      display_instructions
      display_board
      assign_player_markers
      set_current_player
      players_move
      display_winner
      register_score
      display_score
      break unless play_again?
      reset_game
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_instructions
    puts  "You'll take turns marking squares in a 3 x 3 grid."
    puts  "\nThe player who succeeds in placing three of their markers "\
          'in a horizontal, vertical, or diagonal row gets one point.'
    puts  "\nYou'll need to win 5 points to win the game."
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def assign_player_markers
    puts "Choose your marker: 'O' or 'X'"
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
      puts "That marker is not available. Please wait while we assign you a marker..."
      sleep 2
    end
  end

  def display_markers
    puts "You're #{human.marker}. Computer is #{computer.marker}."
  end

  def display_board
    display_markers
    puts ''
    board.draw
    puts ''
  end

  def players_move
    loop do
      current_player_moves
      clear_screen_and_display_board
      display_computer_move if computer_turn?
      break if board.someone_won? || board.full?
      switch_current_player
    end
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
      puts 'Sorry not a valid choice. Please enter either y or n'
    end

    answer == 'y'
  end

  def set_current_player
    if human_goes_first?
      @current_marker = human.marker
    else
      @current_marker = computer.marker
    end
  end

  def current_player_moves
    if @current_marker == human.marker
      human_moves
    else
      computer_moves
    end
  end

  def switch_current_player
    if @current_marker == human.marker
      @current_marker = computer.marker
    else
      @current_marker = human.marker
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
    puts  "\nChoose a square to place your marker "\
          "(#{join_list(board.available_squares)}):"
    chosen_square = nil
    loop do
      chosen_square = gets.chomp.to_i
      break if board.available_squares.include?(chosen_square)
      puts 'Sorry, please choose from the available squares.'
    end

    board[chosen_square] = human.marker
  end

  def computer_moves
    computer_choice = board.available_squares.sample
    board[computer_choice] = computer.marker
    computer.all_moves_made << computer_choice
    puts "\nComputer is making a move..."
    sleep 1
  end

  def computer_turn?
    @current_marker == computer.marker
  end

  def display_computer_move
    puts "Computer chose square #{computer.all_moves_made.last}."
  end

  def display_winner
    clear_screen_and_display_board

    case board.return_winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def clear
    (system 'clear') || (system 'cls')
  end

  def play_again?
    answer = nil
    loop do
      puts "\nWould you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def reset_game
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

new_game = TTTGame.new
new_game.play
