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

def initial_deal(deck)
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  [player_cards, dealer_cards]
end

def opening_prompts(round, dealer_cards, player_cards)
  prompt "ROUND: #{round}"
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."
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

def player_turn(deck, player_cards)
  loop do
    player_choice = nil
    loop do 
      prompt "Would you like to hit(h) or stay(s)?"
      player_choice = gets.chomp.downcase
      break if player_choice.start_with?('h', 's')
      prompt "Please enter 'hit'('h') or 'stay'('s')."
    end

    if player_choice.start_with?('h')
      player_cards << deck.pop
      prompt "You chose to hit..."
      sleep(2)
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
      sleep(2)
    end

    break if busted?(player_cards) || player_choice.start_with?('s')
  end

  player_cards
end

def dealer_turn(deck, dealer_cards)
  prompt "Dealer turn..."
  sleep(2)

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= BUST_VALUE - 4

    prompt "Dealer hits..."
    sleep(2)
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
    sleep(2)
  end

  dealer_cards
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

def detect_winner(score)
  if score[:player] == 5
    :player
  elsif score[:dealer] == 5
    :dealer
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

def display_winning_message(score)
  winner = detect_winner(score)
  case winner 
  when :player then puts "Congratulation! You won!"
  when :dealer then puts "Dealer won!"
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

def display_score(score)
  prompt "Your score: #{score[:player]}; Dealer's score: #{score[:dealer]}"
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

score = { player: 0, dealer: 0 }
round = 0
prompt "Welcome to Twenty-One! First to 5 wins the game!"

loop do
  deck = initialize_deck
  player_cards, dealer_cards = initial_deal(deck)
  round += 1
  display_score(score)
  opening_prompts(round, dealer_cards, player_cards)
  player_cards = player_turn(deck, player_cards)

  if busted?(player_cards)
    register_result(dealer_cards, player_cards, score)
    grand_output(dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    sleep(2)  
  else
    prompt "You stayed at #{total(player_cards)}"
    sleep(2)

    dealer_cards = dealer_turn(deck, dealer_cards)
    dealer_total = total(dealer_cards)

    if busted?(dealer_cards)
      prompt "Dealer total is now: #{dealer_total}"
      sleep(2)
    else
      prompt "Dealer stays at #{dealer_total}"
      sleep(2)
    end

    register_result(dealer_cards, player_cards, score)
    grand_output(dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    sleep(2)
  end

  if detect_winner(score)
    display_winning_message(score)
    reset_score(score)
    round = 0
    break unless play_again?
  end
end

prompt "Thank you for playing Twenty-One! Good bye!"
