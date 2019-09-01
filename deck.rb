class Deck
  CARDS = [ '2s', '2c', '2h', '2d', '3s', '3c', '3h', '3d', '4s', '4c', '4h', '4d',
            '5s', '5c', '5h', '5d', '6s', '6c', '6h', '6d', '7s', '7c', '7h', '7d',
            '8s', '8c', '8h', '8d', '9s', '9c', '9h', '9d', 'Ts', 'Tc', 'Th', 'Td',
            'Js', 'Jc', 'Jh', 'Jd', 'Qs', 'Qc', 'Qh', 'Qd', 'Ks', 'Kc', 'Kh', 'Kd',
            'As', 'Ac', 'Ah', 'Ad' ].freeze
  
  def initialize
    @current_deck = CARDS.dup
    shuffle
  end

  def deal
    current_deck.shift 
  end

  def shuffle
    current_deck = CARDS.dup
    @current_deck.shuffle!
  end

  

  attr_reader :current_deck
end
