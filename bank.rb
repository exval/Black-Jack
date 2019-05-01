class Bank
  attr_reader :amount
  
  BET = 10.freeze

  def initialize
    @amount = 0
  end

  def bet(player, dealer)
    player.lose_bet(BET)
    dealer.lose_bet(BET)
    @amount = BET * 2
  end

  def zero?(player)
    player.bank < BET
  end

  def reward

  end

  def draw
    
  end

  def can_bet?
    
  end
end
