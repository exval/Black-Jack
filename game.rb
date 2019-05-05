require_relative 'bank'
require_relative 'card'
require_relative 'desk'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'
require_relative 'interface'


class Game
  attr_reader :bank, :deck, :dealer, :player, :interface

  def initialize
    @desk = Desk.new
    @dealer = Dealer.new
    @bank = Bank.new
    @interface = Interface.new
    @state = :playing
    add_user
  end

  def add_user
    name = @interface.create_user
    @user = Player.new(name)
  end

  def launch
    while @state != :finish do
      if have_money?
        distribution
        init_interface
      else
        @interface.lose_info
        break
      end

    while @state != :referee do
      round
    end
    one_more_game?
  end
end

  # protected
  
  def deal_cards(player, number)
    number.times do |time|
      card = @desk.cards.first
      player.get_card(card)
      @desk.remove_from_deca(card)
    end
  end

  def distribution
    deal_cards(@user, 2)
    deal_cards(@dealer, 2)
    @user.open_cards
    @dealer.close_cards
  end
  
  def user_turn
    return if @user.hand.full?
    deal_cards(@user, 1)
    @interface.user_cards(@user)
  end

  def dealer_turn
    return if @state == :referee
    if @dealer.take_card?
      @interface.dealer_take_card(@dealer)
      deal_cards(@dealer, 1)
    else
      @interface.dealer_check(@dealer)
    end
  end

  def round
    input = @interface.choice_action

    case input
    when 1
      dealer_turn
    when 2
      user_turn
      dealer_turn
    when 3
      referee
    end
  end

  def init_interface
    if @bank.can_bet?(@user) && @bank.can_bet?(@dealer) 
      bet
      @interface.bet_info(@bank)
    else
      @interface.open_cards_info
      referee
    end
    @interface.dealer_cards(@dealer)
    @interface.user_cards(@user)
  end

  def scoring 
    return if @user.score > Hand::MAX_SCORE && @dealer.score > Hand::MAX_SCORE
    return if @user.score == @dealer.score
    return @dealer if @user.score > Hand::MAX_SCORE
    return @user if @dealer.score > Hand::MAX_SCORE

    [@user, dealer].max_by(&:score)
  end

  def referee
    winner = scoring
    @dealer.open_cards
    @interface.dealer_scores_info(@dealer)
    @state = :referee
    case winner
    when Player
      @interface.win_info
      @bank.reward(@user)
    when Dealer
      @interface.lose_info
      @bank.reward(@dealer)
    else
      @interface.draw_info
      @bank.draw(@user, @dealer)
    end
  end

  def bet
    @bank.bet(@user, @dealer)
  end

  def have_money?
    @user.bank > Bank::BET ? true : false
  end

  def one_more_game?
    input = @interface.continue?
    if input == 'д'
      @state = :playing
      reset 
      puts 'Новый раунд'
    else
      @state = :finish
    end
  end

  def reset
    @user.take_new_dec
    @dealer.take_new_dec
  end

  def no_any_turn?
    !@user.hand.full?
  end

end

game = Game.new
game.launch