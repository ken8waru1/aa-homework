class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    require_sequence
    show_sequence
    unless self.game_over 
      round_success_message
      @sequence_length += 1
    else
      @game_over = true
    end 
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      system("clear")
    end
  end

  def require_sequence
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "やるじゃねぇか"
  end

  def game_over_message
    puts "rest in pepperoni"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
