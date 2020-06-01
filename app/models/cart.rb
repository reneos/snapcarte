class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :restuaurant
  has_many :orders
  end
end
