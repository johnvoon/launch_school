VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'sp' => 'spock',
  'l' => 'lizard'
}

WINNING_COMBOS = {
  'rock'     => %w(scissors lizard),
  'scissors' => %w(paper lizard),
  'paper'    => %w(rock spock),
  'lizard'   => %w(paper spock),
  'spock'    => %w(rock scissors)
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def convert_input(input)
  if VALID_CHOICES.values.include?(input)
    input
  elsif VALID_CHOICES.keys.include?(input)
    VALID_CHOICES[input]
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
    rock (r);
    paper (p);
    scissors (s);
    lizard (l);
    spock (sp)
    MSG

    player_input = gets.chomp.downcase
    if  VALID_CHOICES.keys.include?(player_input) ||
        VALID_CHOICES.values.include?(player_input)
      break
    else
      prompt "Choice invalid. Please re-enter"
    end
  end

  player_choice = convert_input(player_input)

  computer_choice = VALID_CHOICES.values.sample

  prompt "You chose #{player_choice}; Computer chose #{computer_choice}"

  result = results(player_choice, computer_choice)

  if result == "player won"
    player_score += 1
  elsif result == "computer won"
    computer_score += 1
  elsif result == "tie"
    prompt "Tie for this round!"
  end

  prompt "Player: #{player_score} ; Computer: #{computer_score}"
  if player_score == 5
    prompt "Congratulations, you win!"
    prompt "Play again? (y/n)"
    player_score = 0
    computer_score = 0
    if play_again?
      clear_screen
    else break
    end
  elsif computer_score == 5
    prompt "Computer won, better luck next time!"
    prompt "Play again? (y/n)"
    player_score = 0
    computer_score = 0
    if play_again?
      clear_screen
    else break
    end
  end
end

prompt("Thanks for playing. Good bye!")
