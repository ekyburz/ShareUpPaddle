user1 = User.create(email: 'user1@example.com', password: 'password', first_name: 'Etienne', last_name: 'Kyburz')
user2 = User.create(email: 'user2@example.com', password: 'password', first_name: 'Anh Nahm', last_name: 'Le Giang')
user3 = User.create(email: 'user2@example.com', password: 'password', first_name: 'Nicolas', last_name: 'Messer')

board1 = Board.create(name: 'Surfboard', availability: true, price: 50, description: 'A cool surfboard', user: user1)

booking = Booking.create(board: board1, user: user2)

puts 'Seed data created successfully!'
