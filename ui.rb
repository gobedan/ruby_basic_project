class UI
  attr_reader :hero, :dealer, :bet

  def initialize(player1, player2, bet)
    @dealer = player1
    @hero = player2
    @bet = bet 
  end

  def help
    puts 'Type \'help\' to recieve command list'
    puts 'Type \'exit\' to quit'
  end

  def print_showdown
    puts ''
    puts '**********SHOWDOWN!*********'
    print 'Dealer has: '
    print_hand(dealer.hand)
    print "   (Score: #{dealer.score})"
    puts ' '
    print 'Hero has: '
    print_hand(hero.hand)
    print "   (Score: #{hero.score})"
    puts ' '
    puts '--------------------------'
    puts ''
  end

  def casino_won
    hero.stack -= bet
    dealer.stack += bet
    puts 'Casino won!'
  end

  def hero_won
    hero.stack += bet
    dealer.stack -= bet
    puts 'Player won!'
  end

  def print_hand(hand)
    hand.cards.each do |card|
      print card.to_s
    end
  end

  def print_turn
    puts ''
    puts '------------------------------'
    puts "Dealer stack: #{dealer.stack}"
    puts "#{hero.name} stack: #{hero.stack}"
    puts "Current bet: #{bet}"
    puts '============================================'
    print 'Dealt to dealer: '
    print '* *'
    print '   (Score: ??)'
    puts ' '
    print 'Dealt to hero: '
    print_hand(hero.hand)
    print "   (Score: #{hero.score})"
    puts ' '
    puts '------------------------------'
    puts ''
  end

  def choose_action
    loop do
      puts 'Choose action: '
      puts '1. Draw'
      puts '2. Check'
      print ':>  '
      user_input = gets.chomp
      if user_input == '1'
        puts 'Player draws..'
        break 1
      end
      if user_input == '2'
        puts 'Player checks..'
        break
      end
      break -1 if user_input == 'exit'
    end
  end
end
