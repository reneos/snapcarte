class Restaurant < ApplicationRecord
  after_create_commit :create_menus
  belongs_to :user
  has_many :menus, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :dishes, through: :menus
  validates :address, :name, :phone_number, :cuisine, :menu_photo, :description, :photo, presence: true
  has_one_attached :photo
  has_one_attached :menu_photo
  accepts_nested_attributes_for :menus

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def status
    open ? "Accepting orders" : "Currently closed"
  end

  private
  def create_menus
    if !self.coords.empty?
      coords = JSON.parse(self.coords)
    else
      coords = ['']
    end
    photo_key = self.menu_photo.key
    username = ENV['CLOUDINARY_URL'].split('@').last
    coords.each do |coord|
      menu = Menu.create(restaurant: self)
      coord = coord.map {|k,v| "#{k}_#{v}"}.join(',') unless coord.empty?
      dish_array = ImageReader.transcribe(photo_key, coord, username)
      DishAdder.call(dish_array, menu)
    end
  end
end
