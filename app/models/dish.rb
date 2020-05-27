class Dish < ApplicationRecord
  validates :name, :price, presence: true
  has_many :entries, dependent: :destroy
  has_many :menus, through: :entries
end
