User.delete_all
Booking.delete_all
Board.delete_all

user1 = User.create(email: 'user1@example.com', password: 'password', first_name: 'Etienne', last_name: 'Kyburz')
user2 = User.create(email: 'user2@example.com', password: 'password', first_name: 'Anh Nam', last_name: 'Le Giang')
user3 = User.create(email: 'user3@example.com', password: 'password', first_name: 'Nicolas', last_name: 'Messer')

board1 = Board.create(name: 'Surfboard', availability: true, price: 50, description: 'A cool surfboard', user: user1)
board2 = Board.create(name: 'Paddleboard', availability: true, price: 70, description: 'A not so cool Paddlboard',
                      user: user1)
board3 = Board.create(name: 'Queen Elisabeth', availability: true, price: 9_999_999,
                      description: 'Yep its the ship allright', user: user2)

booking = Booking.create(board: board1, user: user2)
booking2 = Booking.create(board: board2, user: user3)
booking3 = Booking.create(board: board3, user: user1)

puts 'Seed data created successfully!'
