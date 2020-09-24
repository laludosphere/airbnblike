puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."
flat = Flat.create!(
  user:        User.last,
  name: "Test",
  address:     "55 rue du Faubourg Saint Honoré, 75008 Paris",
  price:       250,
  stars: 3
)
puts "Finished!"
