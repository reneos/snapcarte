
class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :dishes, dependent: :destroy
  validates :photos, presence: true
  after_create_commit :transcribe_text
  has_many_attached :photos
  accepts_nested_attributes_for :dishes

  private
  def transcribe_text
    url = self.photos.first.service_url
    dish_array = ImageReader.transcribe(url)
    DishAdder.call(dish_array, self)
  end

end
