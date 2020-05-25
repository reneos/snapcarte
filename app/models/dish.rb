class Dish < ApplicationRecord
  validates :name, :price, :description, presence: true
  has_many :entries
  has_many :menus, through: :entries
end
