class Dish < ApplicationRecord
  validates :name, :price_cents, presence: true
  belongs_to :menu
  monetize :price_cents

  def pricetag
    string_price = "$#{price_cents.to_f/100}"
    string_price += string_price.match?(/\.\d$/) ? "0" : ""
    string_price
  end
end
