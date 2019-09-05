require_relative './card.rb'

class Deck
  def initialize
    create_deck
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
    @current_deck = []
    while @current_deck.size != 52
      card = Card.new
      @current_deck.push(card) unless has_card?(card)
    end
  
  end

  def has_card?(card)
    @current_deck.each do |existing_card|
      if existing_card.to_s == card.to_s
        return true
      end
    end
    false
  end
end
