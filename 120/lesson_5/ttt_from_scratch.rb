class Board
  def initialize
    @all_squares = {}
    reset
  end

  def reset
    @all_squares.each do |square_number,_|
      @all_squares[square_number] = square_number
    end 
  end
end

class TTTGame
  def initialize
    @board = Board.new
  end

  def display_welcome_message
    puts "Hi! Welcome to Tic Tac Toe"
  end

  def display_board
    puts "You're X. Computer is O."
    vertical_line = "     |     |     "
    horizontal_line = "-----+-----+-----"
    puts grid_line * 3
    puts center_line
    puts grid_line * 3
    puts center_line
    puts grid_line * 3
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe. See you again next time!"
  end

  def play
    display_welcome_message
    display_board
    display_goodbye_message
  end
end

new_game = TTTGame.new
new_game.play