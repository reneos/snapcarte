
class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :entries
  has_many :dishes, through: :entries
  validates :currency, :photos, presence: true
  has_many_attached :photos


end
