class Interface
  GREET = 'Добро пожаловать в игру Black-Jack'.freeze
  LINE = "\n".freeze
  ACTIONS_USER = [
    'Пропустить ход',
    'Взять карту',
    'Открыть карты'
  ].freeze

  ACTIONS_DEALER = [
    'Диллер пропускает ход',
    'Диллер берет карту',
    'Диллер открывает карты'
  ].freeze

  def initialize
    greet
  end

  def create_user
    puts 'Для начала игры введите своё имя:'
    gets.chomp
  end

  def avaible_actions
    puts ACTIONS_USER
  end

  def user_action
    choice_action
  end

  def dealer_cards(dealer)
    puts LINE
    puts "Диллер: #{dealer.bank} $"

    dealer.hand.cards.each do |card|
      if card.type == :closed
        print '*'
      else
        print card.rank + card.suit + '|'
      end
    end
    puts LINE
    puts LINE
  end

  def user_cards(user)
    puts "Игрок: #{user.name}, #{user.bank} $"

    user.hand.cards.each do |card|
      print card.rank + card.suit + '|'
    end
    puts "Очки: #{user.hand.score}"
    puts LINE
  end

  def dealer_check(_dealer)
    puts ACTIONS_DEALER[0]
    puts LINE
  end

  def dealer_take_card(_dealer)
    puts ACTIONS_DEALER[1]
    puts LINE
  end

  def dealer_scores_info(dealer)
    puts ACTIONS_DEALER[2]
    dealer_cards(dealer)
    puts "Очки диллера: #{dealer.hand.score}"
    puts LINE
  end

  def open_all(user, dealer)
    dealer_scores_info(dealer)
    user_cards(user)
  end

  def bet_info(bank)
    puts "Текущая ставка: #{bank.amount} $"
  end

  def lose_info
    puts 'Ты проиграл.'
  end

  def win_info
    puts 'Ты выиграл.'
  end

  def draw_info
    puts 'Ничья.'
  end

  def continue?
    puts 'Хотите продожить?(Д/н)'
    choice = gets.chomp.downcase
  end

  def greet
    puts GREET
  end

  def choice_action
    puts 'Ваши действия:'
    ACTIONS_USER.each.with_index(1) do |action, index|
      puts "#{index}. #{action}"
    end
    input = gets.to_i
  end
end
