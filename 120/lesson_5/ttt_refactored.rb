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
  attr_reader :marker, :all_moves_made

  def initialize(marker)
    @marker = marker
    @all_moves_made = []
  end
end

class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message

    loop do
      display_board
      players_move
      display_winner
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

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board
    puts "You're #{human.marker}. Computer is #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def players_move
    loop do
      current_player_moves
      clear_sceen_and_display_board
      display_computer_move if computer_turn?
      break if board.someone_won? || board.full?
      switch_current_player
    end
  end

  def clear_sceen_and_display_board
    clear
    display_board
  end

  def current_player_moves
    if @current_marker == HUMAN_MARKER
      human_moves
    else
      computer_moves
    end
  end

  def switch_current_player
    if @current_marker == HUMAN_MARKER
      @current_marker = COMPUTER_MARKER
    else
      @current_marker = HUMAN_MARKER
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
      puts 'Sorry, please choose from the available squares.'
    end

    board[chosen_square] = human.marker
  end

  def computer_moves
    computer_choice = board.available_squares.sample
    board[computer_choice] = computer.marker
    computer.all_moves_made << computer_choice
    puts 'Computer is making a move...'
    sleep 1
  end

  def computer_turn?
    @current_marker == COMPUTER_MARKER
  end

  def display_computer_move
    puts "Computer chose square #{computer.all_moves_made.last}."
  end

  def display_winner
    clear_sceen_and_display_board

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
      puts 'Would you like to play again? (y/n)'
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
