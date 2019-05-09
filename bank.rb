class Bank
  attr_reader :amount

  BET = 10

  def initialize
    @amount = 0
  end

  def bet(player, dealer)
    player.lose_amount(BET)
    dealer.lose_amount(BET)
    @amount = BET * 2
  end

  def zero?(player)
    player.bank < BET
  end

  def reward(player)
    player.get_amount(@amount)
  end

  def draw(player, dealer)
    player.get_amount(@amount / 2)
    dealer.get_amount(@amount / 2)
    @amount = 0
  end

  def can_bet?(player)
    player.bank >= BET
  end
end
