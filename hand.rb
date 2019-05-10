class Hand
  attr_accessor :cards

  MAX_SCORE = 21
  MAX_CARDS = 3

  def initialize
    @cards = []
    @summary ||= 0
  end

  def score
    sum ||= 0
    sum = @cards.sum(&:value)

    @cards.each do |card|
      sum -= Card::ACE_SECOND if sum > MAX_SCORE && card.ace?
    end
    sum
  end
  
  def full?
    @cards.size == MAX_CARDS
  end
end
