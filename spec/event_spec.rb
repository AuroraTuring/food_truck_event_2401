require './lib/item'
require './lib/event'
require './lib/food_truck'

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe "#initialize" do
    it "exists" do
      expect(@event).to be_a(Event)
    end

    it "has attributes" do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
      expect(@event.food_trucks).to eq([])
    end
  end

  describe "#methods" do
    it "can add food trucks that sell stocked items to an event" do
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)

      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)

      @food_truck3.stock(@item1, 65)

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])

      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])

      # Below was moved to food_truck:
      # expect(@food_truck1.potential_revenue).to eq(148.75)
      # expect(@food_truck2.potential_revenue).to eq(345.00)
      # expect(@food_truck3.potential_revenue).to eq(243.75)
    end

  end

end
