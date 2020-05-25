class Dish < ApplicationRecord
  validates: :name, :price, :description, presence: true
end
