# frozen_string_literal: true
require 'pry'
class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Mertrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  # rubocop:enable Metrics/Abcsize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :name

  def initialize(marker)
    @marker = marker
  end

  def set_name
    name = ''
    loop do
      puts "Please type your name:" if marker == '_'
      puts "Please type computer's name" if marker == 'O'
      name = gets.chomp
      break unless name.empty?
      puts "Empty is not allow!"
      puts ""
    end
    self.name = name
  end
end

class TTTGame
  HUMAN_MARKER = "_"
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @score = Score.new
  end

  def play
    pre_game_set
    loop do
      display_board
      game_play
      update_score_board
      display_result_and_score
      break if score.reach_five_point?
      break unless play_again?
      reset
      display_play_again_message
    end
    display_winner_message
    display_goodbye_message
  end

  private

  def pre_game_set
    clear
    display_welcome_message
    set_names
    set_player_marker
    set_first_to_move
    clear
  end

  def game_play
    loop do
      current_player_moves

      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def clear
    system 'clear'
  end

  def joinor(arr, delimiter=', ', word='or')
    arr[-1] = "#{word} #{arr.last}" if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
  end

  def human_first?
    answer = ''
    loop do
      puts "Would you like to go first? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def set_player_marker
    custom_marker = ''
    loop do
      puts "Please choose one character as your mark"
      custom_marker = gets.chomp
      if custom_marker.size == 1 && custom_marker != 'O'
        # Change the initialize Player.new.marker to custom_marker
        human.marker = custom_marker
        break
      end
      puts "Enter one size character please('O' is not allow)"
      puts ""
    end
  end

  def set_names
    human.set_name
    computer.set_name
  end

  def set_first_to_move
    @current_player = human_first? ? @human.marker : @computer.marker
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "First one gets 5 points is winner!!"
    puts ""
  end

  def display_board
    puts "#{human.name} is a #{human.marker}.  " \
         "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def human_turn?
    @current_player == human.marker
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
    alternate_current_player
  end

  def alternate_current_player
    @current_player = human_turn? ? COMPUTER_MARKER : human.marker
  end

  def human_moves
    puts "Chose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not valid choice"
    end
    board[square] = human.marker
  end

  def find_at_risk_square(line, squares, marker)
    if squares.values_at(*line).collect(&:marker).count(marker) == 2
      risk_squares = squares.select do |k, v|
        line.include?(k) && v.marker == ' '
      end
      return   risk_squares.keys.first
    end
    nil
  end

  def computer_counter_square(board, marker)
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, marker)
      return square if square
    end
    nil
  end

  def computer_moves
    # offence
    square = computer_counter_square(board.squares, COMPUTER_MARKER)
    # defence
    if !square
      square = computer_counter_square(board.squares, human.marker)
    end

    if !square
      square = if board.unmarked_keys.include?(5)
                 5
               else
                 board.unmarked_keys.sample
               end
    end
    board[square] = computer.marker
  end

  def update_score_board
    case board.winning_marker
    when human.marker
      score.scoreboard[:human] += 1
    when computer.marker
      score.scoreboard[:computer] += 1
    end
  end

  def display_result_and_score
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie."
    end
    display_score
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def reset
    board.reset
    clear
  end

  def display_winner_message
    if score.human_reach_five?
      puts "You play a good game!!"
    elsif score.computer_reach_five?
      puts "Challenge again and you can do better!!"
    end
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_score
    puts "#{human.name} vs #{computer.name} = " \
         "#{score.scoreboard[:human]} : #{score.scoreboard[:computer]}"
  end
end

class Score
  attr_accessor :scoreboard

  def initialize
    @scoreboard = { human: 0, computer: 0 }
  end

  def human_reach_five?
    scoreboard[:human] >= 5
  end

  def computer_reach_five?
    scoreboard[:computer] >= 5
  end

  def reach_five_point?
    scoreboard[:human] >= 5 || scoreboard[:computer] >= 5
  end
end

game = TTTGame.new
game.play