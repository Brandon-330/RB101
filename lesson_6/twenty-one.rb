def create_deck()
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
  card = {random_card => hash[random_card]}
  
  # Update cards from sampled symbol, and return card key/value
  deck[index] = hash.reject { |k, _| k == random_card }
  card
end

def show_player_cards(card_hashes)
  key_list = card_hashes.map do |hash|
    hash.keys.each(&:to_s)
  end
  puts "You have: " + key_list[0..-2].join(', ') + " and #{key_list[-1][0]}"
end

def score(card_in_hand)
  values_arr = card_in_hand.map do |hash|
    hash.values[0]
  end
  values_arr.sum
end

def ask_player()
  answer = ''
  loop do
    puts "=> Would you like to hit or stay?"
    answer = gets.chomp
    break if answer.downcase == 'hit' || answer.downcase == 'stay'
    puts 'That is not a valid choice! Pick "hit" or "stay"'
  end
  answer
end

def win?(player_score, dealer_score)
  if player_score > 21 && dealer_score > 21
    "It is a tie, you both blew with you having #{player_score} and dealer having #{dealer_score}!"
  elsif player_score < 21 && player_score > dealer_score
    "The player wins with #{player_score} and dealer with #{dealer_score}!"
  elsif dealer_score < 21 && player_score < dealer_score
    "The dealer wins with #{dealer_score} and you with #{player_score}!"
  elsif player_score == dealer_score
    "It is a tie, you ended with #{player_score} and dealer with #{dealer_score}"
  elsif player_score > 21
    "The dealer wins! You blew with you having #{player_score} and dealer having #{dealer_score}"
  elsif dealer_score > 21
    "The player wins with #{player_score} and dealer blows with #{dealer_score}"
  end
end

deck = create_deck()
player_cards, dealer_cards = [], []
player_score, dealer_score = 0, 0

player_cards << draw_card(deck) << draw_card(deck)
dealer_cards << draw_card(deck) << draw_card(deck)

loop do
  puts "Dealer has: #{dealer_cards[0].keys[0]} and unknown card"
  show_player_cards(player_cards)
  player_score = score(player_cards)

  answer = ask_player()
  break if player_score > 21 || answer.downcase == 'stay'
  player_cards << draw_card(deck)
end

loop do
  dealer_score = score(dealer_cards)
  break if dealer_score >= 17
  dealer_cards << draw_card(deck)
end

puts win?(player_score, dealer_score)