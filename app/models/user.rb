class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :phone_number, format: { with: /\./ }
  has_many :restaurants
  has_many :carts, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}".titleize
  end
end
