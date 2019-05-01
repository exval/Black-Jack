# require_relative 'card'
# require_relative 'desk'

class Hand

  attr_accessor :cards

    MAX_SCORE = 21.freeze
    MAX_CARDS = 3.freeze

  def initialize
    @cards = []
  end

  def score
  sum ||= 0
  sum = @cards.sum(&:value)

  @cards.each do |card|
    if sum > MAX_SCORE && card.ace?
      sum -= Card::ACE_SECOND
    end
  end
  sum
  end
  
  def full?
    @cards.size == MAX_CARDS
  end
end
