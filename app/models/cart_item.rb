class CartItem < ApplicationRecord
  belongs_to :dish
  belongs_to :cart
end
