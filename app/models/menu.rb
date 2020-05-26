
class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :entries
  has_many :dishes, through: :entries
  validates :currency, :photos, presence: true
  after_create_commit :transcribe_text
  has_many_attached :photos




  private
  def transcribe_text
    image_key = self.photos.first.key
    dish_array = ImageReader.transcribe(image_key)
    DishAdder.call(dish_array, self)
  end

end
