user1 = User.create(email: 'user1@example.com', password: 'password', first_name: 'John', last_name: 'Doe')
user2 = User.create(email: 'user2@example.com', password: 'password', first_name: 'Jane', last_name: 'Doe')

board1 = Board.create(name: 'Surfboard', availability: true, price: 50, description: 'A cool surfboard', user: user1)

booking = Booking.create(board: board1, user: user2)

puts 'Seed data created successfully!'
