

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


class Score
  attr_accessor :player, :dealer

  def initialize
    @player = 0
    @dealer = 0
  end

  def reset_score
    self.player = 0
    self.dealer = 0
  end

  def someone_won?
    player == 5 || dealer == 5
  end
end

class Player
  attr_accessor :cards, :hand_total

  def initialize
    @cards = []
    @hand_total = 0
  end

  def adjust_total_for_aces(card_values)
    number_of_aces = card_values.select { |value| value == 'A' }.count
    number_of_aces.times do
      hand_total -= 10 if sum > BUST_VALUE
    end
  end

  def compute_hand_total
    card_values = cards.map { |card| card[1] }
    card_values.each do |card_value|
    self.hand_total = if value == 'A'
                        hand_total + 11
                      elsif value.to_i == 0
                        hand_total + 10
                      else
                        hand_total + value.to_i
                      end
    adjust_total_for_aces(card_values)
  end
end

class TwentyOneGame
  SUITS = ['H', 'D', 'S', 'C'].freeze
  VALUES = ['2', '3', '4', '5', '6', '7', '8',
            '9', '10', 'J', 'Q', 'K', 'A'].freeze
  BUST_VALUE = 21

  attr_reader :human, :dealer
  attr_accessor :deck, :round_number

  def initialize
    @human = Player.new
    @dealer = Player.new
    @deck = initialize_deck
    @score = Score.new
    @round_number = 0
  end

  def play
    display_welcome_message
    initial_deal
    display_cards
    display_score
    display_goodbye_message
  end

  private

  def initialize_deck
    SUITS.product(VALUES).shuffle
  end

  def initial_deal(deck)
    2.times do
      dealer.cards << deck.pop
      player.cards << deck.pop
    end
  end

  def display_cards
    puts "The Dealer has #{dealer.cards[0]} and [an unknown card]"
    puts "You have: #{human.cards[0]} and #{human.cards[1]}, "\
         "for a total of #{total(player_cards)}."
  end

  def display_round_number
    puts "ROUND: #{round_number}"
  end

  def register_score
    if 
      score.human += 1
    elsif  
      score.dealer += 1
  end

  def reset_round_number
    self.round_number = 0
  end

  def display_welcome_message
    puts "Welcome to Twenty-One! First to 5 wins the game!"
  end

  def display_score
    puts "Your score: #{player_score}  Dealer's score: #{dealer_score}"
  end

  def play_again?
    loop do
      prompt "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break true if %w(y yes).include?(answer)
      break false if %w(n no).include?(answer)
      prompt "Enter yes(y) or no(n)"
    end
  end

  def display_goodbye_message
    puts "Thank you for playing Twenty-One! Good bye!"
  end

  def initialize_deck
    SUITS.product(VALUES).shuffle
  end
end

new_game = TwentyOneGame.new
new_game.play