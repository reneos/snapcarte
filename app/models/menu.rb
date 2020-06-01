
class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes, dependent: :destroy
  accepts_nested_attributes_for :dishes
end
