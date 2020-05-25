class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :entries
  has_many :dishes, through: :entries
  validates :currency, presence: true

end
