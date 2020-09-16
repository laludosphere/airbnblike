puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats..."
flat1 = { name: "Flat", address: "108, avenue du peuple belge, Lille, 59000", stars: 5 }
flat2 =  { name: "House", address: "154, rue calmette, Lambres, 59552", stars: 3}

[ flat1, flat2].each do |element|
  flat = Flat.create!(element)
  puts "Created #{flat.name}"
end
puts "Finished!"
