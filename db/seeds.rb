User.delete_all
Booking.delete_all
Board.delete_all

user1 = User.create!(email: 'user1@example.com', password: 'password', first_name: 'Etienne', last_name: 'Kyburz')
user2 = User.create!(email: 'user2@example.com', password: 'password', first_name: 'Anh Nam', last_name: 'Le Giang')
user3 = User.create!(email: 'user3@example.com', password: 'password', first_name: 'Nicolas', last_name: 'Messer')

board1 = Board.create(name: 'Surfboard', availability: true, price_cents: 100, description: 'A cool surfboard',
                      user: user1, address: 'Zürcher Yacht Club')
board2 = Board.create(name: 'Paddleboard', availability: true, price_cents: 100, description: 'A not so cool Paddlboard',
                      user: user1, address: 'Wollishofen')
board3 = Board.create(name: 'Queen Elisabeth', availability: true, price_cents: 100,
                      description: 'Yep its the ship allright', user: user2, address: 'Strandbad Tiefenbrunnen')

booking = Booking.create(board: board1, user: user2)
booking2 = Booking.create(board: board2, user: user3)
booking3 = Booking.create(board: board3, user: user3)

puts 'Seed data created successfully!'
