class DishAdder
  def self.call(dish_array, menu)
    dish_array.each do |line|
      name = line[0]
      price = self.parse_price(line[1])
      Dish.create(
        name: name,
        price: price,
        menu: menu
        )
    end
  end

  def self.parse_price(price)
    if price.include?('.')
      price.delete('.').to_i
    else
      price.to_i * 100
    end
  end

end
