class Dish < ApplicationRecord
  validates :name, :price, presence: true
  has_many :entries
  has_many :menus, through: :entries
end
