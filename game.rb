require_relative './player.rb'
require_relative './deck.rb'

class Game 

  attr_reader :dealer, :hero, :deck 

  def initialize(name)
    @dealer = Player.new('dealer')
    @hero = Player.new(name)
    @deck = Deck.new
  end

  def deal_new_hand
    deck.shuffle 
    dealer.hand.push(deck.deal)
    hero.hand.push(deck.deal)
    dealer.hand.push(deck.deal)
    hero.hand.push(deck.deal)
  end

end
