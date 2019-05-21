class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each.with_index do |cup, i|
      unless i == 6 || i == 13
        4.times { cup << :stone } 
      end
    end
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
    distributed_stones = @cups[start_pos]
    @cups[start_pos] = []

    i = start_pos
    until distributed_stones.empty?
      i += 1
      i = 0 if i > @cups.length - 1

      if i == 6
        @cups[6] << distributed_stones.shift if current_player_name == @name1
      elsif i == 13
        @cups[13] << distributed_stones.shift if current_player_name == @name2
      else
        @cups[i] << distributed_stones.shift
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..6].all? { |cup| cup.empty? } || @cups[7..-1].all? { |cup| cup.empty? } 
  end

  def winner
    prc = Proc.new { |a, b| a <=> b } 
    case prc.call(@cups[6], @cups[13])
    when 0 
      :draw
    when 1
      @name1
    when - 1
      @name2
    end
  end
end
