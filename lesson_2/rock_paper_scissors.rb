# Prompt user for a choice between rock, paper, or scissors
# Create a method which picks 1 element from a rock, paper, scissor array
# if statements to determine who won

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

display_reults(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt("You won!")
  elsif (player == 'scissors' && computer == 'rock') ||
        (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors')
    prompt("You lost!")
  else
    prompt("It is a tie!")
  end
end

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(", ")}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice!")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)
  
  prompt("Would you like to play again? ")
  break unless Kernel.gets().chomp().downcase().start_with?('y')
end

prompt("Thank you for playing. Have a great day!")