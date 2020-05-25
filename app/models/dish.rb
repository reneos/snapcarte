class Dish < ApplicationRecord
  validates :name, :price, :description, presence: true
  has_one :entry
  has_one :menu, through: :entry
end
