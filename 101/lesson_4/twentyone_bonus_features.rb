SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8',
          '9', '10', 'J', 'Q', 'K', 'A'].freeze
BUST_VALUE = 21

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0

  values.each do |value|
    sum = if value == 'A'
            sum + 11
          elsif value.to_i == 0
            sum + 10
          else
            sum + value.to_i
          end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > BUST_VALUE
  end

  sum
end

def busted?(cards)
  total(cards) > BUST_VALUE
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > BUST_VALUE
    :player_busted
  elsif dealer_total > BUST_VALUE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins this round!"
  when :dealer_busted
    prompt "Dealer busted! You win this round!"
  when :player
    prompt "You win this round!"
  when :dealer
    prompt "Dealer wins this round!"
  when :tie
    prompt "It's a tie this round!"
  end
end

def register_result(dealer_cards, player_cards, score)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    score[:dealer] += 1
  when :dealer_busted
    score[:player] += 1
  when :player
    score[:player] += 1
  when :dealer
    score[:dealer] += 1
  end
end

def display_score(dealer_score, player_score)
  prompt "Your score: #{player_score}; Dealer's score: #{dealer_score}"
end

def winner(score)
  if score[:player] == 5
    :player
  elsif score[:dealer] == 5
    :dealer
  end
end

def reset_score(score)
  score[:player] = 0
  score[:dealer] = 0
end

def grand_output(dealer_cards, player_cards)
  puts "========="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of #{total(player_cards)}"
  puts "========="
end

def play_again?
  puts "----------"
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt "Enter yes(y) or no(n)"
  end
end

def clear_screen
  system 'clear'
end

# main game loop

score = { player: 0, dealer: 0 }
round = 1

prompt "Welcome to Twenty-One! First to 5 wins the game!"
loop do
  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "ROUND: #{round}"
  display_score(score[:dealer], score[:player])
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  # player turn
  # if call total here and store as variable, totals will not be updated
  loop do
    player_turn = nil
    loop do # validate player input to h or s
      prompt "Would you like to hit(h) or stay(s)?"
      player_turn = gets.chomp.downcase
      break if ['h', 'hit', 's', 'stay'].include?(player_turn)
      prompt "Please enter 'hit'('h') or 'stay'('s')."
    end

    if player_turn == 'h' || player_turn == 'hit'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if  player_turn == 's' ||
              player_turn == 'stay' ||
              busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    register_result(dealer_cards, player_cards, score)
    round += 1
    if winner(score) == :player
      prompt "Congratulations! You won 5 rounds!"
      reset_score(score)
      break unless play_again?
    elsif winner(score) == :dealer
      prompt "Dealer won 5 rounds!"
      reset_score(score)
      break unless play_again?
    end
    grand_output(dealer_cards, player_cards)
    next
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= BUST_VALUE - 4

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  dealer_total = total(dealer_cards)
  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    display_result(dealer_cards, player_cards)
    register_result(dealer_cards, player_cards, score)
    round += 1
    if winner(score) == :player
      prompt "Congratulations! You won #{score} rounds!"
      reset_score(score)
      break unless play_again?
    elsif winner(score) == :dealer
      prompt "Dealer won #{score} rounds!"
      reset_score(score)
      break unless play_again?
    end
    grand_output(dealer_cards, player_cards)
    next
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  grand_output(dealer_cards, player_cards)

  display_result(dealer_cards, player_cards)
  register_result(dealer_cards, player_cards, score)
  round += 1
  if winner(score) == :player
    prompt "Congratulations! You won #{score} rounds!"
    reset_score(score)
    break unless play_again?
  elsif winner(score) == :dealer
    prompt "Dealer won #{score} rounds!"
    reset_score(score)
    break unless play_again?
  end
end

prompt "Thank you for playing Twenty-One! Good bye!"
