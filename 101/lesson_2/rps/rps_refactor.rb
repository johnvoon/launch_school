VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

loop do
  first = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    player = gets.chomp
    if VALID_CHOICES.include?(first)
      break
    else
      prompt "That's not a valid first."
    end
  end

  computer = VALID_CHOICES.sample

  prompt "You chose #{first}; Computer chose #{second}"

  display_results(player, computer)

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing. Good bye!")
