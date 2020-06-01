class DishAdder
  def self.call(dish_array, menu)
    dish_array.each do |line|
      name = line[0]
      price = ((line[1].to_f) * 100).to_i
      Dish.create(
        name: name,
        price: price,
        menu: menu
        )
    end
  end

end
