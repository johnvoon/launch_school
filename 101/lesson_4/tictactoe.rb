require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze
FIRST_MOVE = "default".freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "Welcome to Tic Tac Toe. First to 5 wins."
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if  brd.values_at(*line).count(marker) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER) != 0
    brd.select do |square, mark|
      line.include?(square) && mark == INITIAL_MARKER
    end.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(choices, separator = ', ', final_separator = 'or')
  result = ""
  choices.take(choices.count - 1).each_with_index do |choice, index|
    if index <= choices.count - 3
      result += choice.to_s + separator
    elsif index > choices.count - 3
      result += choice.to_s + ' ' + final_separator + ' ' + choices.last.to_s
    end
  end
  result
end

def register_result(brd, score)
  if detect_winner(brd) == 'Player'
    score[:player] += 1
  elsif detect_winner(brd) == 'Computer'
    score[:computer] += 1
  end
end

def display_result(player_score, computer_score)
  prompt "Your score: #{player_score}; Computer's score: #{computer_score}"
end

def reset_score(score)
  score[:player] = 0
  score[:computer] = 0
end

def play_again?
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt("Please enter 'yes(y)' or 'no(n)'.")
  end
end

score = { player: 0, computer: 0 }

current_player = 0
loop do
  board = initialize_board
  display_board(board)
  prompt "Who goes first? Player(P) or Computer(C)"
  answer.gets.chomp.downcase
  answer.start_with?("p") ? current_player = 0 : current_player = 1
  loop do
    place_piece!(board, current_player)
    current_player += 1
    display_board(board)
    break if someone_won(board) || board_full(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round"
    register_result(board, score)
  else
    prompt "It's a tie!"
  end
  display_result(score[:player], score[:computer])
  
  if score[:player] == 5
    reset_score(score)
    prompt "Congratulations! You won 5 rounds!"
    prompt "Play again?(y/n)"
    break unless play_again?
  elsif score[:computer] == 5
    reset_score(score)
    prompt "Computer won 5 rounds!"
    prompt "Play again?(y/n)"
    break unless play_again?
  end
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
