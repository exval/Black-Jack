class Dealer < User
  def initialize
    super 'Dealer'
  end

  def close_cards
    @hand.cards.each { |card| card.type = :closed }
  end

  def take_card?
    @hand.score < 17 && Hand::MAX_CARDS <= 3
  end
end
