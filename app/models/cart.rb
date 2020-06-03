class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :cart_items, dependent: :destroy
  has_many :dishes, through: :cart_items

  def self.find_by_user_and_restaurant(user, restaurant)
    Cart.where(user: user, restaurant: restaurant).first
  end

  def total_items
    self.cart_items.count
  end

  def total
    "$#{self.cart_items.map {|i| i.dish.price}.sum}"
  end

  def add(dish)
    CartItem.create(dish: dish, cart: self)
  end

  def empty?
    cart_items.none?
  end

  def not_sent?
    self.confirmed == 0
  end

  def pending?
    self.confirmed == 1
  end

  def accepted?
    self.confirmed == 2
  end

  def completed?
    self.confirmed == 3
  end
end
