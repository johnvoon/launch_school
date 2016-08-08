VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_results(player, computer)
  if  (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
    prompt "You won!"
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  player = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    player = gets.chomp
    if VALID_CHOICES.include?(player)
      break
    else
      prompt "That's not a valid player."
    end
  end

  computer = VALID_CHOICES.sample

  prompt "You chose #{player}; Computer chose #{computer}"

  display_results(player, computer)

  prompt "Do you want to play again? (y/n)"
  answer = gets.chomp
  break unless another_calculation
end

prompt("Thanks for playing. Good bye!")
