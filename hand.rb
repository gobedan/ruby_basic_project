class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def score
    result = 0
    cards.each do |card|
      result += card.score
    end
    result = check_for_aces if result > 21
    result
  end

  def check_for_aces
    result = 0
    cards.each do |card|
      if card.ace?
        result += 1
      else
        result += card.score
      end
    end
    result
  end
end
