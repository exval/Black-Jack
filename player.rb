class Player

  START_BANK = 100.freeze

  attr_reader :name, :hand
  attr_accessor :bank

  def initialize(name)
    @name = name 
    @bank = START_BANK
    @hand = Hand.new
  end

  def get_amount(amount)
    @bank += amount
  end

  def lose_amount(bet)
    @bank -= bet
    @bank = 0 if bet < 0
  end

  def score
    @hand.score
  end

  def get_card(card)
    @hand.cards << card
  end

  def take_new_dec
    @hand.cards = []
    @desk = Desk.new
  end

  def open_cards
    @hand.cards.each { |card| card.type = :open }
  end
end
