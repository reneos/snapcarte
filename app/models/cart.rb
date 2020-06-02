class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :cart_items
  has_many :dishes, through: :cart_items

  def self.find_by_user_and_restaurant(user, restaurant)
    Cart.where(user: user, restaurant: restaurant).first
  end

  def add(dish)
    CartItem.create(dish: dish, cart: self)
  end

  def empty?
    cart_items.none?
  end
end
