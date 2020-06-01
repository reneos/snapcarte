class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :orders
  acts_as_shopping_cart_using :cart_item
end
