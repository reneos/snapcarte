class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  validates :address, :name, :phone_number, :cuisine, :description, :photo, presence: true
  accepts_nested_attributes_for :menus
  has_one_attached :photo
end
