class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    inventory[item] ||= 0
  end

  def stock(item, quantity)
    inventory[item] ||= 0
    inventory[item] += quantity
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
    (item.price * quantity)
    end
    # total_sum = @inventory.map do |item, quantity|
    # (item.price * quantity)
    # end
    # total_sum.sum
  end

end
