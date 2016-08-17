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