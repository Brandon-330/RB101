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
  card_in_hand.each do |hash|
    sum = hash.values.inject(&:+)
  end
  
  if sum > 21
    card_in_hand.each do |hash|
      hash.keys.each do |key|
        if key == "Ace"
          sum -= 10
end

deck = create_deck()
player_cards, dealer_cards = [], []

player_cards << draw_card(deck) << draw_card(deck)
dealer_cards << draw_card(deck) << draw_card(deck)

loop do
  puts "Dealer has: #{dealer_cards[0].keys[0]} and unknown card"
  show_player_cards(player_cards)
  score()
  break
end

