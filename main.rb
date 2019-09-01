require_relative './player.rb'
require_relative './deck.rb'
require_relative './game.rb'

class Main
  attr_reader :game
  attr_accessor :round
  def initialize
    @round = 1 
    puts "Welcome to BlackJack! by Gobedan" 
    game_start 
  end
 
  def help
    puts 'Type \'help\' to recieve command list'
    puts 'Type \'exit\' to quit' 
  end
  
  def game_start
    puts "Enter player name: "
    print ':>  '
    user_input = gets.chomp
    @game = Game.new(user_input)
    help if user_input == 'help'
    return if user_input == 'exit'
    game_round
    game_over
  end

  def game_over
    puts "Game over!"
    puts "Try again? y/n"
    user_input = gets.chomp
    game_start if user_input == 'y' || user_input == 'Y'
  end

  def game_round
    loop do
      break if game.dealer.stack < 10 || game.hero.stack < 10
      game.deal_new_hand
      puts ""
      puts "Round №#{round}"
      print_turn
      break if choose_action == -1
      dealers_turn
      print_showdown 
      define_winner 
      self.round += 1 
    end
  end

  def dealers_turn
    if game.dealer.score < 17 && game.hero.score < 22 
      game.draw(game.dealer)
      puts "Dealer draws.."
    else 
      puts "Dealer checks.."
    end
  end 

  def print_showdown
    puts ""
    puts "**********SHOWDOWN!*********"
    print "Dealer has: "
    print_hand(game.dealer.hand)
    print "   (Score: #{game.dealer.score})"
    puts " " 
    print "Hero has: "
    print_hand(game.hero.hand)
    print "   (Score: #{game.hero.score})"
    puts " "
    puts "--------------------------"
    puts ""
  end

  def define_winner
    if ( game.hero.score > 21 || 
         game.dealer.score > game.hero.score ) &&
       game.dealer.score < 22   

      casino_won
    elsif ( game.dealer.score > 21 || 
            game.hero.score > game.dealer.score ) &&
          game.hero.score < 22   

      hero_won
    else
      puts "There is a tie! " 
    end
  end

  def casino_won 
    game.hero.stack -= game.bet 
    game.dealer.stack += game.bet 
    puts "Casino won!"
  end

  def hero_won
    game.hero.stack += game.bet 
    game.dealer.stack -= game.bet
    puts "Player won!"
  end

  def print_hand(hand)
    hand.each do |card|
      print card
    end
  end

  def print_turn 
    puts ""
    puts "------------------------------"
    puts "Dealer stack: #{game.dealer.stack}"
    puts "#{game.hero.name} stack: #{game.hero.stack}"
    puts "Current bet: #{game.bet}"
    puts "============================================"
    print "Dealt to dealer: "
    print "* *"
    print "   (Score: ??)"
    puts " " 
    print "Dealt to hero: "
    print_hand(game.hero.hand)
    print "   (Score: #{game.hero.score})"
    puts " " 
    puts "------------------------------"
    puts ""
  end

  def choose_action
    loop do 
      puts "Choose action: "
      puts "1. Draw"
      puts "2. Check"
      print ':>  '
      user_input = gets.chomp
      if user_input == "1"
        game.draw(game.hero)
        puts "Player draws.."
        break
      end
      if user_input == "2"
        puts "Player checks.."
        break
      end
      break -1 if user_input == "exit"
    end
  end
end

main = Main.new
