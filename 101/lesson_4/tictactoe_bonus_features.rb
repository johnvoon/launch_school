require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

FIRST_MOVE = "choose".freeze

def prompt(msg)
  puts "#{msg}"
  puts " "
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
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

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
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

def computer_places_piece!(brd)
  square =  if find_at_risk_square(brd, COMPUTER_MARKER, PLAYER_MARKER)
              find_at_risk_square(brd, COMPUTER_MARKER, PLAYER_MARKER)
            elsif find_at_risk_square(brd, PLAYER_MARKER, COMPUTER_MARKER)
              find_at_risk_square(brd, PLAYER_MARKER, COMPUTER_MARKER)
            elsif brd[5] == INITIAL_MARKER
              5
            else 
              empty_squares(brd).sample
            end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_line(brd, first = PLAYER_MARKER, second = COMPUTER_MARKER)
  risk_line = []
  WINNING_LINES.each do |line|
    next unless brd.values_at(*line).count(first) == 2 &&
                brd.values_at(*line).count(second) == 0
    risk_line = line
    break
  end
  risk_line
end

def find_at_risk_square(brd, first = PLAYER_MARKER, second = COMPUTER_MARKER)
  at_risk_line = find_at_risk_line(brd, first, second)
  return nil if at_risk_line.nil?
  at_risk_line.each do |square|
    if brd[square] != first
      return square
    end
  end
  nil
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

def joinor(choices, delimiter = ', ', conjunction = 'or')
  choices[-1] = "#{conjunction} #{choices.last}" if choices.size > 1
  choices.join(delimiter)
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
loop do
  board = initialize_board
  current_player = 'player'

  if FIRST_MOVE == 'choose'
    loop do
      prompt "Who goes first? player or computer?"
      first = gets.chomp
      if first.casecmp('computer') == 0 || first.casecmp('player') == 0
        current_player = first.downcase
        break
      else
        prompt "Please choose computer or player"
      end
    end
  end

  loop do
    display_board(board)
    display_result(score[:player], score[:computer])
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won this round"
    register_result(board, score)
  else
    prompt "It's a tie!"
  end

  display_result(score[:player], score[:computer])

  if score[:player] == 5
    prompt "Congratulations! You won 5 rounds!"
  elsif score[:computer] == 5
    prompt "Computer won 5 rounds!"
  end

  reset_score(score)
  prompt "Play again?(y/n)"
  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
