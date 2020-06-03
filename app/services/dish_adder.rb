class DishAdder
  def self.call(dish_array, menu)
    dish_array.each do |line|
      name = line[0]
      price_cents = ((line[1].to_f) * 100).to_i
      Dish.create(
        name: name,
        price_cents: price_cents,
        menu: menu
        )
    end
  end

end
8.60
