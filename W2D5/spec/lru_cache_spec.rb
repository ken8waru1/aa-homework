require 'rspec'
require 'lru_cache'

RSpec.describe "LRUCache" do
  subject(:cache) { LRUCache.new(5) }
  let(:items1) { ["things", "more things", "even more things", "how many things do we need", "just this many", "but actually one more to test one feature"] }
  let(:items2) { [5, 3, 5] }
  describe "#initialize" do 
    it "should set the cache's maximum capacity" do 
      expect(cache.capacity).to eq(5)
    end

    it "should initially set cache to an empty array" do
      expect(cache.cache).to eq([])
    end
  end

  describe "#count" do

    it "should show the number of items in the cache" do 
      items1.each { |item| cache.add(item) }
      expect(cache.count).to eq(5)
    end
  end

  describe "#add" do
    it "should add items to the cache" do
      cache.add(4)
      expect(cache.cache).to eq([4])
    end

    it "should remove the first (least recently used) item in the cache when adding new item and cache is at capacity" do
      items1.each { |item| cache.add(item) }
      expect(cache.cache).to eq(["more things", "even more things", "how many things do we need", "just this many", "but actually one more to test one feature"])
    end

    it "should check if an item being added already exists in the cache and update the cache to reflect it's recently been accessed (move an item to the end of the cache)" do
      items2.each { |item| cache.add(item) }
      expect(cache.cache).to eq([3, 5])
    end
  end

  describe "#show" do
    it "should display the current cache" do 
      items2.each { |item| cache.add(item) }
      expect(cache.show).to eq([3, 5])
    end
  end
end