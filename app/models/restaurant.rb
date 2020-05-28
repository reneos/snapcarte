class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus
  validates :address, :name, :phone_number, :cuisine, :description, :photo, presence: true
  accepts_nested_attributes_for :menus
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def status
    open ? "open" : "closed"
  end
end
