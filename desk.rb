require_relative 'card'


class Desk
  attr_accessor :cards

  def initialize
    @cards = []
    genered_deck
    @cards.shuffle!
  end

  def take_cards
    raise 'Нет карт' if cards.size.zero?

    cards.pop    
  end

  def genered_deck
    Card::SUIT.each do |suit|
      Card::VALUE_CARDS.each do |rank, value|
        @cards << Card.new(rank, suit, value)
      end
    end
  end
end
