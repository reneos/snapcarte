class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  # has_many :orders
  acts_as_shopping_cart_using :cart_item

  def self.find_by_user_and_restaurant(user, restaurant)
    Cart.where(user: user, restaurant: restaurant)
  end
end
