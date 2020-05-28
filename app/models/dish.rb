class Dish < ApplicationRecord
  validates :name, :price, presence: true
  belongs_to :menu

  def pricetag
    float_price = "#{price.to_f / 100}"
    float_price += float_price.match?(/\.\d$/) ? "0" : ""
    "$#{float_price}"
  end
end
