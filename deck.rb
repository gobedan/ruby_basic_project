require_relative './card.rb'

class Deck
  def initialize
    @current_deck = []
    @current_deck = create_deck
    shuffle
  end

  def deal
    current_deck.shift
  end

  def shuffle
    create_deck
    @current_deck.shuffle!
  end

  private

  attr_accessor :current_deck

  def create_deck
    new_deck = []
    while new_deck.size != 52
      card = Card.new
      new_deck.push(card) unless has_card?(card, new_deck)
    end
    new_deck
  end

  def has_card?(card, deck)
    deck.each do |existing_card|
      if existing_card.to_s == card.to_s
        return true
      end
    end
    false
  end
end
