# Prompt user for a choice between rock, paper, or scis
# sors
# Create a method which picks 1 element from a rock, paper, scissor array
# if statements to determine who won

VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def player_choice(choice)
  choice.downcase!
  if choice.start_with?('r')
    'rock'
  elsif choice.start_with?('p')
    'paper'
  elsif choice.start_with?('l')
    'lizard'
  elsif choice.start_with?('sc')
    'scissors'
  elsif choice.start_with?('sp')
    'spock'
  end
end


def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("You lost the round!")
  else
    prompt("Tied round!")
  end
end

def scoreboard(player, computer, player_wins, computer_wins)
  if win?(player, computer)
    player_wins += 1
  elsif win?(computer, player)
    computer_wins += 1
  end
  [player_wins, computer_wins]
end

player_wins, computer_wins = 0, 0
loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')} (or type 'r', 'p', 'l', 'sc', or 'sp')")
    choice = player_choice(Kernel.gets().chomp())

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('That is not a valid choice!')
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  player_wins, computer_wins = scoreboard(choice, computer_choice, player_wins, computer_wins)
  if player_wins == 3
    prompt('The grand winner is you!')
  elsif computer_wins == 3
    prompt('The grand winner is the computer!')
  end
  break if player_wins == 3 || computer_wins == 3
end

prompt('Thank you for playing. Have a great day!')