class Card
  SUITS = ['s', 'c', 'd', 'h'].freeze
  NUMS = [2, 3, 4, 5, 6, 7, 8, 9].freeze
  BROADWAYS = ['T', 'J', 'Q', 'K'].freeze
  ACE = ['A'].freeze
  NOMINALS = [NUMS, BROADWAYS, ACE].freeze

  attr_reader :nominal, :suit

  def initialize
    @nominal = NOMINALS.sample.sample
    @suit = SUITS.sample
  end

  def ace?
    nominal == ACE[0]
  end

  def broadway?
    BROADWAYS.include?(nominal)
  end

  def number?
    NUMS.include?(nominal)
  end

  def to_s
    nominal.to_s + suit.to_s
  end

  def score
    if number?
      nominal.to_i
    elsif ace?
      11
    elsif broadway?
      10
    end
  end
end
