  class LRUCache
    attr_reader :cache, :capacity

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
        update_to_recent(el)
      elsif cache.size == capacity
        update(el)
      else
        cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      cache
    end

    private
    def update_to_recent(el)
      cache.delete(el)
      cache << el
    end

    def update(el)
      cache.shift
      cache << el
    end
  end