puts "Destroying all users"
User.destroy_all
puts "Users : destroyed"

puts "destroying all bookings"
Booking.destroy_all
puts "Bookings : destroyed"

puts "Destroying all flats"
Flat.destroy_all
puts "Flats : destroyed"

puts "Seeding users"
ludo  = User.create!( email: 'ludo@gmail.com',  password: 'azerty')
margaux = User.create!( email: 'margaux@gmail.com', password: 'azerty')


puts "Users ok !"

puts "Seeding flats"
ludo_flat = Flat.create(
  user:         ludo,
  name:       'flat',
  address:    "20 rue des Abbesses, 75018 Paris",
  price:        250,
  )

margaux_flat = Flat.create(
  user:           margaux,
  name:         'house',
  address:      "16 villa Gaudelet, 75011 Paris",
  price:          155,
  )

puts "flats ok !"

puts "Seeding bookings"
first_booking = Booking.create(
  start_date: '2020-09-25',
  end_date:   '2020-09-30',
  user:       margaux,
  flat:       ludo_flat,
  )

second_booking = Booking.create(
  start_date: '2020-09-25',
  end_date:   '2020-09-30',
  user:        ludo,
  flat:        margaux_flat,
  )

puts "Bookings added"
puts "all done !"