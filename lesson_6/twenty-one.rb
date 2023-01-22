# Formulate full deck (52 cards)
cards = Hash.new
Array(1..10).each do |el|
  cards[el] = el
end
cards["Jack"], cards["Queen"], cards["King"], cards["Ace"] = 10, 10, 10, 11
deck = [cards, cards, cards, cards]

p rand(deck.size)

def draw_card(deck)
  index = rand(deck.size)
  hash = deck[index]

  random_card = hash.keys.sample
  {random_card => hash[random_card]}
  # hash.each do |k, v|
  #   k, v
  # index = rand(deck.size)
  # cards = deck.sample
  # random_card = cards.sample
  
  # random_card
end

draw_card(deck)
player_cards = []
dealer_cards = []

