class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }.each.with_index do |cup, i|
      unless i == 6 || i == 13
        4.times { cup << :stone } 
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if @cups[start_pos].nil?
      raise ArgumentError.new "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise ArgumentError.new "Starting cup is empty"
    end

    true
  end

  def make_move(start_pos, current_player_name)

    i = start_pos
    until @cups[start_pos].empty?
      i += 1
      i = 0 if i == 13
      if i == 6 && current_player_name == @name1
        @cups[6] << @cups[start_pos].shift
      elsif i == 13 && current_player_name == @name2
        @cups[13] << @cups[start_pos].shift
      else
        @cups[i] << @cups[start_pos].shift
      end
    end 
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
