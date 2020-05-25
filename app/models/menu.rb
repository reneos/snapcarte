class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :entries
  has_many :dishes, through: :entries
  validates :currency, :photo, presence: true
  has_many_attached :photos
end
