require_relative './player.rb'
require_relative './deck.rb'
require_relative './ui.rb'

class Game

  attr_reader :dealer, :hero, :deck, :bet, :round, :ui

  def initialize
    @dealer = Player.new('dealer')
    @deck = Deck.new
    @bet = 10
    @round = 1
    game_start
  end

  def deal_new_hand
    deck.shuffle
    hero.muck
    dealer.muck
    deal_card(hero)
    deal_card(dealer)
    deal_card(hero)
    deal_card(dealer)
  end

  def draw(player)
    deal_card(player)
  end

  private

  def deal_card(player)
    player.hand.cards.push(deck.deal)
  end

  def define_winner
    if (hero.score > 21 ||
         dealer.score > hero.score) &&
       dealer.score < 22

      ui.casino_won
    elsif (dealer.score > 21 ||
            hero.score > dealer.score) &&
          hero.score < 22

      ui.hero_won
    else
      puts 'There is a tie! '
    end
  end

  def game_start
    puts 'Welcome to BlackJack! by Gobedan'
    puts "Enter player name: \n:>"
    user_input = gets.chomp
    @hero = Player.new(user_input)
    @ui = UI.new(@dealer, @hero, @bet)
    ui.help if user_input == 'help'
    return if user_input == 'exit'

    game_round
    game_over
  end

  def game_over
    puts 'Game over!'
    puts 'Try again? y/n'
    user_input = gets.chomp.capitalize
    game_start if user_input == 'Y'
  end

  def game_round
    loop do
      break if dealer.stack < 10 || hero.stack < 10

      deal_new_hand
      puts "\nRound №#{@round}"
      ui.print_turn
      action = ui.choose_action
      break if action == -1
      deal_card(hero) if action == 1 
      dealers_turn
      ui.print_showdown
      define_winner
      @round += 1
    end
  end

  def dealers_turn
    if dealer.score < 17 && hero.score < 22
      deal_card(dealer)
      puts 'Dealer draws..'
    else
      puts 'Dealer checks..'
    end
  end
end

Game.new
