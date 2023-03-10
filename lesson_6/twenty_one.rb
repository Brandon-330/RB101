def valid_game
  answer = ''
  loop do
    puts "Game will work until what value?"
    answer = gets.chomp
    break if answer.to_i > 0
    puts "Invalid option, please choose a positive number"
  end
  answer.to_i
end

def create_deck
  cards = Hash.new
  Array(1..10).each do |el|
    cards[el] = el
  end
  cards["Jack"], cards["Queen"], cards["King"], cards["Ace"] = 10, 10, 10, 11

  [cards, cards, cards, cards]
end

def draw_card(deck)
  # Sample between Hearts, Diamonds, Clubs, Spades
  index = rand(deck.size)
  hash = deck[index]

  # Random card from the sampled cards
  random_card = hash.keys.sample
  card = { random_card => hash[random_card] }

  # Update cards from sampled symbol, and return card key/value
  deck[index] = hash.reject { |k, _| k == random_card }
  card
end

def show_cards(card_hashes)
  key_list = card_hashes.map do |hash|
    hash.keys.each(&:to_s)
  end
  key_list[0..-2].join(', ') + ' and ' + key_list[-1][0].to_s
end

def score(cards_in_hand)
  values_arr = cards_in_hand.map do |hash|
    hash.values[0]
  end
  values_arr.sum
end

def ask_player
  answer = ''
  loop do
    puts "=> Would you like to hit or stay?"
    answer = gets.chomp
    break if answer.downcase == 'hit' || answer.downcase == 'stay'
    puts 'That is not a valid choice! Pick "hit" or "stay"'
  end
  answer
end

def check_ace(cards_in_hand)
  is_ace_found = false
  cards_in_hand.each do |hash|
    hash.each do |k, v|
      if k == "Ace" && v == 11 && !is_ace_found
        is_ace_found = !is_ace_found
        hash[k] = v - 10
      end
    end
  end
  [cards_in_hand, score(cards_in_hand)]
end

def win?(player_score, dealer_score)
  if player_score > BUST_RULE && dealer_score > BUST_RULE
    "It is a tie, you both blew with you having #{player_score} and dealer having #{dealer_score}!"
  elsif player_score <= BUST_RULE && player_score > dealer_score
    "The player wins with #{player_score} and dealer lose with #{dealer_score}!"
  elsif dealer_score <= BUST_RULE && player_score < dealer_score
    "The dealer wins with #{dealer_score} and you lose with #{player_score}"
  elsif player_score == dealer_score
    "It is a tie, you ended with #{player_score} and dealer with #{dealer_score}"
  elsif player_score > BUST_RULE
    "The dealer wins. You blew by having #{player_score} and dealer wins by having #{dealer_score}"
  elsif dealer_score > BUST_RULE
    "The player wins with #{player_score} and dealer blows with #{dealer_score}!"
  end
end

puts "Welcome to twenty one!"
sleep(1)
BUST_RULE = valid_game()

loop do
  deck = create_deck()
  player_cards, dealer_cards = [], []
  player_score, dealer_score = 0, 0

  player_cards << draw_card(deck) << draw_card(deck)
  dealer_cards << draw_card(deck) << draw_card(deck)

  loop do
    puts
    puts "Dealer has: #{dealer_cards[0].keys[0]} and unknown card"
    puts "You have: #{show_cards(player_cards)}"
    puts
    player_score = score(player_cards)

    # If player score is greater than BUST_RULE, reassign ace value
    if player_score > BUST_RULE
      player_cards, player_score = check_ace(player_cards)
    end

    break if player_score > BUST_RULE
    answer = ask_player()
    break unless answer.downcase == 'hit'
    player_cards << draw_card(deck)
  end

  loop do
    dealer_score = score(dealer_cards)
    if dealer_score > BUST_RULE
      dealer_cards, dealer_score = check_ace(dealer_cards)
    end

    break if dealer_score >= (BUST_RULE - 4)
    dealer_cards << draw_card(deck)
  end

  puts "=" * 40
  puts "Dealer has: #{show_cards(dealer_cards)}"
  puts "You have: #{show_cards(player_cards)}"
  puts

  puts win?(player_score, dealer_score)
  puts
  puts "Would you like to play again?"
  break unless gets.chomp.downcase.start_with?('y')
end
