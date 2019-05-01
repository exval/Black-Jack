class Card
  
  attr_accessor :suit, :value, :rank

  ACE_SECOND = 10
  SUIT = %w[<3 <> + ^].freeze
  VALUE_CARDS = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "J" => 10,
    "Q" => 10,
    "K" => 10,
    "A" => 11
  }.freeze

  def initialize(rank, suit, value)
    @suit = suit
    @value = value
    @rank = rank
  end

  def ace?
    @value == 11 
  end
end
