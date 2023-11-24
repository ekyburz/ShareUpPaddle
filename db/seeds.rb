# Import the necessary gems
require 'cloudinary'

# Set up Cloudinary credentials
Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_CLOUD_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
end

# Delete existing data
User.delete_all
Booking.delete_all
Board.delete_all

# Create new seed data with Cloudinary attachments
user1 = User.create!(email: 'user1@example.com', password: 'password', first_name: 'Etienne', last_name: 'Kyburz')
user2 = User.create!(email: 'user2@example.com', password: 'password', first_name: 'Anh Nam', last_name: 'Le Giang')
user3 = User.create!(email: 'user3@example.com', password: 'password', first_name: 'Nicolas', last_name: 'Messer')

# Attach profile pictures for users
user1.photo.attach(
  io: URI.open('https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'), filename: 'profile_picture.jpg'
)
user2.photo.attach(
  io: URI.open('https://images.pexels.com/photos/7562313/pexels-photo-7562313.jpeg?auto=compress&cs=tinysrgb&w=1200'), filename: 'profile_picture.jpg'
)
user3.photo.attach(
  io: URI.open('https://images.pexels.com/photos/7897404/pexels-photo-7897404.jpeg?auto=compress&cs=tinysrgb&w=1200'), filename: 'profile_picture.jpg'
)

board1 = Board.create(name: 'Surfboard', availability: true, price_cents: 100, description: 'A cool surfboard',
                      user: user1, address: 'Zürcher Yacht Club')
board2 = Board.create(name: 'Paddleboard', availability: false, price_cents: 100,
                      description: 'A not so cool Paddlboard', user: user1, address: 'Wollishofen')
board3 = Board.create(name: 'Queen Elisabeth', availability: true, price_cents: 100,
                      description: 'Yep its the ship allright', user: user2, address: 'Strandbad Tiefenbrunnen')

# Attach pictures for boards
board1.photos.attach(
  io: URI.open('https://images.pexels.com/photos/930398/pexels-photo-930398.jpeg?auto=compress&cs=tinysrgb&w=1200'), filename: 'picture1.jpg'
)
board2.photos.attach(
  io: URI.open('https://images.pexels.com/photos/1394264/pexels-photo-1394264.jpeg?auto=compress&cs=tinysrgb&w=1200'), filename: 'picture2.jpg'
)
board3.photos.attach(
  io: URI.open('https://images.pexels.com/photos/1656662/pexels-photo-1656662.jpeg?auto=compress&cs=tinysrgb&w=1200'), filename: 'picture3.jpg'
)

booking1 = Booking.create!(user: user2, board: board1)
booking2 = Booking.create!(user: user2, board: board2)
booking3 = Booking.create!(user: user3, board: board3)

puts 'Seed data created successfully!'
