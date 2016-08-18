class Score
  attr_accessor :human, :dealer

  def initialize
    @human = 0
    @dealer = 0
  end

  def reset
    self.human = 0
    self.dealer = 0
  end
end

class Participant
  attr_accessor :cards, :hand_total, :name

  def initialize
    @cards = []
    @hand_total = 0
    @name = ''
  end

  def adjust_total_for_aces(card_values)
    number_of_aces = card_values.select { |value| value == 'A' }.count
    number_of_aces.times do
      self.hand_total -= 10 if hand_total > TwentyOneGame::BUST_VALUE
    end
  end

  def return_hand_total
    self.hand_total = 0
    card_values = cards.map { |card| card[1] }
    card_values.each do |card_value|
      self.hand_total = if card_value == 'A'
                          hand_total + 11
                        elsif card_value.to_i == 0
                          hand_total + 10
                        else
                          hand_total + card_value.to_i
                        end
    end
    adjust_total_for_aces(card_values)
    hand_total
  end

  def busted?
    return_hand_total > TwentyOneGame::BUST_VALUE
  end
end

class Human < Participant
  def hit
    puts "You chose to hit..."
    sleep(1)
  end

  def stay
    puts "You chose to stay..."
    sleep(1)
  end

  def capitalize(name)
    name[0].upcase + name[1..-1]
  end

  def set_name
    puts "\nPlease enter your name:"
    answer = ''
    loop do
      answer = gets.chomp
      break unless answer =~ /^$|\A\s+\z/
      puts "Please enter your name to continue."
    end
    self.name = capitalize(answer)
  end
end

class Dealer < Participant
  def hit
    puts "\nDealer hits..."
    sleep(1)
  end

  def staying_condition_fulfilled?
    return_hand_total >= 17
  end

  def stay
    puts "\nDealer stays..."
    sleep(2)
  end
end

class TwentyOneGame
  SUITS = ['H', 'D', 'S', 'C'].freeze
  VALUES = ['2', '3', '4', '5', '6', '7', '8',
            '9', '10', 'J', 'Q', 'K', 'A'].freeze
  BUST_VALUE = 21

  attr_reader :human, :dealer
  attr_accessor :deck, :round_number, :score

  def initialize
    @human = Human.new
    @dealer = Dealer.new
    @deck = SUITS.product(VALUES)
    @score = Score.new
    @round_number = 1
  end

  def play
    clear_screen
    display_welcome_message
    set_human_name
    display_instructions

    loop do
      general_game_loop
      display_winning_message
      break unless play_again?
      reset_score
      reset_round_number
    end

    display_goodbye_message
  end

  private

  def shuffle_deck
    puts "\nThe deck is being shuffled..."
    deck.shuffle!
    sleep(1)
  end

  def display_welcome_message
    puts 'Welcome to Twenty-One!'
  end

  def set_human_name
    human.set_name
  end

  def enter_to_continue
    puts "\nPlease press enter to continue."
    loop do
      answer = gets.chomp.downcase
      break if answer =~ /^$/
    end
  end

  def display_instructions
    puts  "\nHi #{human.name}! You are playing against the dealer. "\
          "\nYour aim is to get 21 or as close to under it as possible. "\
          "\nWhen it's your turn, you can Hit (draw another card) "\
          'or Stay (let the dealer have his turn).'\
          "\nNumber cards are worth their face value. "\
          "\nJacks, Kings and Queens are worth 10. "\
          "\nAces are worth 11 or 1 if 11 would cause your hand total "\
          'to exceed the bust value. '\
          "\nIf either participant's hand total exceeds the bust value, "\
          'the game ends. '\
          "\nThe bust value for this game is #{BUST_VALUE}. "\
          "\nIf Dealer's hand total is under 17, he must draw another card."\
          "\nThe first to win 3 rounds wins the game."
    enter_to_continue
  end

  def general_game_loop
    loop do
      main_gameplay_loop
      open_hands
      return_round_result
      display_round_result
      increment_score
      display_score
      break if someone_won?
      increment_round_number
      enter_to_continue
    end
  end

  def main_gameplay_loop
    loop do
      clear_screen
      clear_hands
      display_round_number
      shuffle_deck
      initial_deal
      display_initial_hands
      human_turn
      break if human.busted?
      dealer_turn
      break if dealer.busted? || dealer.staying_condition_fulfilled?
    end
  end

  def clear_screen
    (system 'clear') || (system 'cls')
  end

  def clear_hands
    human.cards.clear
    dealer.cards.clear
  end

  def display_round_number
    puts "This is Round: #{round_number}"
  end

  def initial_deal
    puts "\nCards are being dealt out..."
    2.times do
      dealer.cards << deck.pop
      human.cards << deck.pop
    end
    sleep(1)
  end

  def display_initial_hands
    puts "\nInitial deal complete."
    puts "\nDealer has #{dealer.cards[0]} and an unknown card."
    puts "\nYou have: #{human.cards[0]} and #{human.cards[1]}, "\
         "a hand total of #{human.return_hand_total}."
  end

  def display_human_hand
    puts "\nYour cards are now: #{human.cards}"
    puts "Your hand total is now: #{human.return_hand_total}"
  end

  def process_move(move_choice)
    if move_choice.start_with?('h')
      clear_screen
      human.hit
      human.cards << deck.pop
      display_human_hand
    elsif move_choice.start_with?('s')
      clear_screen
      human.stay
    end
  end

  def human_turn
    loop do
      move_choice = nil
      loop do
        puts "\nPress h to Hit or s to Stay?"
        move_choice = gets.chomp.downcase
        break if move_choice.start_with?('h', 's')
        puts "Please enter 'hit'('h') or 'stay'('s')."
      end

      process_move(move_choice)

      break if human.busted? || move_choice.start_with?('s')
    end
  end

  def display_dealer_hand
    puts "\nDealer's cards are now: #{dealer.cards}"
    puts "Dealer's hand total is now: #{dealer.return_hand_total}"
  end

  def dealer_decision_loop
    loop do
      if dealer.busted?
        break
      elsif dealer.staying_condition_fulfilled?
        dealer.stay
        break
      else
        dealer.hit
        dealer.cards << deck.pop
        display_dealer_hand
        sleep(2)
      end
    end
  end

  def dealer_turn
    puts "\nIt's Dealer's turn now..."
    sleep(1)
    dealer_decision_loop
  end

  def open_hands
    clear_screen
    puts '========='
    puts "Dealer's cards: #{dealer.cards}."\
         "\nDealer's hand total: #{dealer.return_hand_total}."
    puts ''\
         "\nYour cards: #{human.cards}."\
         "\nYour hand total: #{human.return_hand_total}."\
         "\n========="
    puts ""
  end

  def return_round_result
    if human.hand_total > BUST_VALUE
      :human_busted
    elsif dealer.hand_total > BUST_VALUE
      :dealer_busted
    elsif dealer.hand_total < human.hand_total
      :human
    elsif dealer.hand_total > human.hand_total
      :dealer
    else
      :tie
    end
  end

  def display_round_result
    case return_round_result
    when :human_busted
      puts 'You busted! Dealer wins this round'
    when :dealer_busted
      puts 'Dealer busted! You win this round!'
    when :human
      puts "Nice one #{human.name}! You win this round!"
    when :dealer
      puts 'Dealer wins this round!'
    when :tie
      puts 'This round is a tie!'
    end
  end

  def increment_score
    case return_round_result
    when :dealer_busted, :human
      score.human += 1
    when :human_busted, :dealer
      score.dealer += 1
    end
  end

  def display_score
    puts "\nSCORE"
    puts "You: #{score.human}  Dealer: #{score.dealer}"
  end

  def increment_round_number
    self.round_number += 1
  end

  def someone_won?
    score.human == 3 || score.dealer == 3
  end

  def display_winning_message
    if score.human == 3
      puts "\nCongratulations #{human.name}! You won 3 rounds!"
    elsif score.dealer == 3
      puts "\nDealer won 3 rounds!"
    end
  end

  def reset_score
    score.reset
  end

  def reset_round_number
    self.round_number = 1
  end

  def play_again?
    answer = ''
    loop do
      puts "\nDo you wish to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts 'Invalid input detected. Please enter y or n'
    end

    answer == 'y'
  end

  def display_goodbye_message
    puts "Thanks for playing Twenty-One #{human.name}! Goodbye!"
  end
end

new_game = TwentyOneGame.new
new_game.play
