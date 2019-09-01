class Player 
  attr_accessor :stack, :name, :hand

  def initialize(name)
    @name = name
    @hand = []
    @stack = 100
  end

  def score 
    result = 0 
    #Aces should be counted last! 
    hand_sorted.each do |card|
      result += reveal_nominal(card, result)
    end 
    result
  end

  def hand_sorted
    hand.sort do |a, b| 
      b.start_with?("A") ? -1 : 1 
    end 
  end

  def muck
    self.hand = [] 
  end

  private

  def reveal_nominal(card, score)
    if card[0] =~ /\d/
      return card[0].to_i

    elsif card[0] == "A"
        if score + 11 > 21 
          return 1

        else
          return 11 
        end
    else
      return 10
    end  
  end
end
