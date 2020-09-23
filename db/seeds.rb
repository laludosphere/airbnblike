puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."
flat = Flat.create!(
  user:        User.last,
  address:     "55 rue du Faubourg Saint Honoré, 75008 Paris",
  surface:     120,
  price:       250,
  room:        4,
  description: "Amazing Office",
  max_guests:  8,
)
puts "Finished!"
