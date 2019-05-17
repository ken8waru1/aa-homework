class Stack
  def initialize
    stack = []
  end

  def push(el)
    stack.push(el)
  end

  def pop
    stack.pop
  end

  def peek
    stack.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

class Map
  def initialize
    @my_map = []
  end

  def set(key, value)
    if @my_map.any? { |pair| pair.include?(key) }
      @my_map.each_with_index do |pair, idx_1|
        pair.each do |ele|
          @my_map[idx_1][1] = value 
        end
      end
    else
      @my_map << [key, value]
    end
  end

  def get(key)
    @my_map.each do |pair|
      pair.each_with_index do |ele, i|
        if ele == key && i == 0
          return pair
        end
      end
    end
  end

  def delete(key)
    @my_map.each do |pair|
      pair.each_with_index do |ele, i|
        if ele == key && i == 0
          @my_map.delete(pair)
        end
      end
    end
  end

  def show
    @my_map
  end
end