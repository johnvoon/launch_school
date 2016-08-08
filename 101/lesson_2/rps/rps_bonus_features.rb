VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_QUICKINPUT = %w(r p s l sp)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def convert_input(input)
  return input if VALID_CHOICES.include?(input)

  case input
  when "r" then "rock"
  when "p" then "paper"
  when "s" then "scissors"
  when "l" then "lizard"
  when "sp" then "spock"
  end
end

def results(player, computer)
  if win?(player, computer)
    "player won"
  elsif win?(computer, player)
    "computer won"
  else
    "tie"
  end
end

def play_again?
  loop do
    answer = gets.chomp.downcase
    break true if %w(y yes).include?(answer)
    break false if %w(n no).include?(answer)
    prompt("Please enter 'y' or 'n'.")
  end
end

def clear_screen
  system('clear') || system('cls')
end

prompt "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
player_score = 0
computer_score = 0
loop do
  player_input = ''
  loop do
    prompt <<-MSG
    Choose your move:
    (1) rock (r);
    (2) paper (p);
    (3) scissors (s);
    (4) lizard (l);
    (5) spock (sp)
    MSG

    player_input = gets.chomp.downcase
    if  VALID_CHOICES.include?(player_input) ||
        VALID_CHOICES_QUICKINPUT.include?(player_input)
      break
    else
      prompt "Choice invalid. Please re-enter"
    end
  end

  player_choice = convert_input(player_input)

  computer_choice = VALID_CHOICES.sample

  prompt "You chose #{player_choice}; Computer chose #{computer_choice}"

  result = results(player_choice, computer_choice)

  if result == "player won"
    prompt "You won!"
    player_score += 1
  elsif result == "computer won"
    prompt "Computer won!"
    computer_score += 1
  elsif result == "tie"
    prompt "It's a tie!"
  end

  prompt "Player: #{player_score} ; Computer: #{computer_score}"
  next unless player_score == 5 || computer_score == 5
  player_score = 0
  computer_score = 0
  prompt "Play again? (y/n)"
  if play_again?
    clear_screen
  else
    break
  end
end

prompt("Thanks for playing. Good bye!")
