class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  validates :address, :name, :phone_number, :cuisine, presence: true
  accepts_nested_attributes_for :menus
end
