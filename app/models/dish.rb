class Dish < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :menu
  has_many :orders

  def pricetag
    string_price = "$#{price}"
    string_price += string_price.match?(/\.\d$/) ? "0" : ""
    string_price
  end
end
