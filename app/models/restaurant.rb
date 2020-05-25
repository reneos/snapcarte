class Restaurant < ApplicationRecord
  has_many :menus
  validates :address, :name, :phone_number, :cuisine, presence: true
end
