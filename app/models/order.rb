class Order < ApplicationRecord
  belongs_to :dish
  belongs_to :cart
  # acts_as_shopping_cart_item_for :cart
end
