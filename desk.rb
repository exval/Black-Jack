class Desk
  attr_accessor :cards

  def initialize
    @cards = genered_deck
  end

  def remove_from_deca(card)
    raise 'Нет карт' if @cards.size.zero?

    @cards.delete(card)
  end

  def genered_deck
    deck = []
    Card::SUIT.each do |suit|
      Card::VALUE_CARDS.each do |rank, value|
        deck << Card.new(rank, suit, value)
      end
    end
    deck.shuffle!
  end
end
