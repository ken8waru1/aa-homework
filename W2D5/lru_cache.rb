  class LRUCache
    attr_reader :cache, :size

    def initialize(capacity)
      @capacity = capacity
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if cache.include?(el)
        cache.delete(el)
        cache << el
      elsif cache.size == size 
        cache.shift
        cache << el
      else
        cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

  end