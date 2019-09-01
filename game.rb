require_relative './player.rb'
require_relative './deck.rb'

class Game 

  attr_reader :dealer, :hero, :deck, :bet

  def initialize(name)
    @dealer = Player.new('dealer')
    @hero = Player.new(name)
    @deck = Deck.new
    @bet = 10
  end

  def deal_new_hand
    deck.shuffle 
    hero.muck
    dealer.muck
    dealer.hand.push(deck.deal)
    hero.hand.push(deck.deal)
    dealer.hand.push(deck.deal)
    hero.hand.push(deck.deal)
  end

  def draw(player)
    player.hand.push(deck.deal)
  end

end
