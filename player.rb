require_relative './hand.rb'

class Player
  attr_accessor :stack, :name, :hand

  def initialize(name)
    @name = name
    @hand = Hand.new
    @stack = 100
  end

  def muck
    self.hand = Hand.new
  end

  def score
    hand.score
  end
end
