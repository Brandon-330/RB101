def create_deck()
  cards = Hash.new
  Array(1..10).each do |el|
    cards[el] = el
  end
  cards["Jack"], cards["Queen"], cards["King"], cards["Ace"] = 10, 10, 10, 11

  [cards, cards, cards, cards]
end

def draw_card(deck)
  index = rand(deck.size)
  hash = deck[index]

  random_card = hash.keys.sample
  card = {random_card => hash[random_card]}
  hash.delete(random_card)
  card
end

deck = create_deck()
player_cards, dealer_cards = [], []

player_cards << draw_card(deck)
p player_cards
p deck
