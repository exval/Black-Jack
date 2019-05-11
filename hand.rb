class Hand
  attr_accessor :cards, :last_var

  MAX_SCORE = 21
  MAX_CARDS = 3

  def initialize
    @cards = []
    @last_var = 0
  end

  def score
    sum ||= 0
    sum = @cards.sum(&:value)

    @cards.each do |card|
      sum -= Card::ACE_SECOND if sum > MAX_SCORE && card.ace?
    end
    sum
    @last_var = sum
  end
  
  def summary
    @last_var
  end

  def full?
    @cards.size == MAX_CARDS
  end
end
 