#O(n^2)

def sluggish_octopus(fish)
  biggest_fish_found = false

  fish.each_with_index do |fish1, idx1|
    biggest_fish_found = true

    fish.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      biggest_fish_found = false if fish2.length > fish1.length
    end

    return fish1 if biggest_fish_found
  end
end


#O(n log n)

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |a, b| a.length <=> b.length }
    return self if self.length <= 1
    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    merged_arr = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merged_arr << right.shift
      else
        merged_arr << left.shift 
      end
    end

    merged_arr + left + right
  end
end

def dominant_octopus(fish)
  fish.merge_sort[-1]
end

#O(n)

def clever_octopus(fish)
  fish.inject do |fish1, fish2|
    if fish1.length > fish2.length
      fish1
    else
      fish2
    end
  end
end

#O(n) dance

def slow_dance(dir, tiles)
  (0...tiles.length).each { |i| return i if tiles[i] == dir }
end

#O(1) dance

def fast_dance(dir, tiles)
  tiles[dir]
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(fish)
p dominant_octopus(fish)
p clever_octopus(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

p slow_dance("left-down", tiles_array)
p fast_dance("left-up", tiles_hash)