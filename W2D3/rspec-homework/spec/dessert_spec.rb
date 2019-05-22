require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:taiyaki) { Dessert.new("taiyaki", 10, chef) }
  let(:chef) { double("chef", name: "Erina") }

  describe "#initialize" do
    it "sets a type" do 
      expect(taiyaki.type).to eq("taiyaki")
    end

    it "sets a quantity" do
      expect(taiyaki.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(taiyaki.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("taiyaki", '10', "Erina") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      taiyaki.add_ingredient("red bean paste")
      expect(taiyaki.ingredients).to include("red bean paste")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["red bean paste", "brown sugar", "flour", "milk"]
      ingredients.each { |ingredient| taiyaki.add_ingredient(ingredient) }
      taiyaki.mix!
      expect(taiyaki.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      taiyaki.eat(5)
      expect(taiyaki.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { taiyaki.eat(2000000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Erina the Great Baker")
      expect(taiyaki.serve).to eq("Chef Erina the Great Baker has made 10 taiyakis!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(taiyaki)
      taiyaki.make_more
    end
  end
end
