# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  user = User.new
  user.email = Faker::Internet.free_email
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
end

puts "user created"

5.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Games::Witcher.witcher
  restaurant.address = Faker::Address.full_address
  restaurant.phone_number = Faker::PhoneNumber.phone_number
  restaurant.cuisine = Faker::Nation.nationality
  restaurant.user = User.all.sample
  restaurant.save!
end

puts "Created new restaurants"

5.times do
  menu = Menu.new
  menu.currency = Faker::Currency.code
  menu.restaurant = Restaurant.all.sample
  # menu.photos = File.open('../app/assets/images/menu_photo.jpg')
  # file = URI.open(menu)
  # menu.photos.attach(io: file, filename: 'menu_photo.jpg', content_type: 'image/jpg')
  # menu.photos = Rails.root.join("app/assets/images/menu_photo.jpg").open
  menu.photos.attach(io: File.open('app/assets/images/menu_photo.jpg'), filename: 'menu_photo.jpg')
  menu.save!
end
puts "Created currency"
