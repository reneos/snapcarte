# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying all carts"
Cart.destroy_all

puts "creating 30 to 40 users"
rand(30..40).times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  domains = %w(gmail.com yahoo.com lewagon.org)
  email = "#{first_name}#{['', '-', '.','_'].sample}#{last_name}@#{domains.sample}"
  phone_number = Faker::PhoneNumber.cell_phone
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    phone_number: phone_number,
    password: 'password',
    password_confirmation: 'password'
  )
end




puts "creating 100 orders"
if Restaurant.any? && User.count > 1
  restaurant = Restaurant.first
  dishes = Menu.where(restaurant: restaurant).map {|m| m.dishes}.flatten
  100.times do
    user = User.where.not(id: restaurant.user.id).sample
    date = Date.today - rand(1..30)
    time = "#{rand(8..21)}:#{%w(00 15 30 45).sample}"
    pickup_time = DateTime.parse(date.to_s + " " + time)
    cart = Cart.create(
      restaurant: restaurant,
      user: user,
      confirmed: 3,
      pickup_time: pickup_time
    )
    rand(3..8).times do
      CartItem.create(
        dish: dishes.sample,
        cart: cart
      )
    end
  end
  puts "Created 100 orders for restaurant with id #{restaurant.id}"
  puts "Restaurant's user is: #{restaurant.user.email}"
else
  puts "not creating seeds -- make sure you have at least one restaurant and more than 1 user"
end

