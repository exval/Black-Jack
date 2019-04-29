# require_relative 'card'
# require_relative 'desk'

class Hand

  attr_accessor :cards

    MAX_SCORE = 21.freeze

  def initialize
    @cards = {}
  end

  def open_cards
    cards.each_key(&:show_card)
  end

  def take_card
    
  end

  def check
    
  end

  def card_score
    
  end

  def total_score
    
  end

end