
user = User.first || User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password')


10.times do |i|
  Offer.create(
    title: "Offer Title #{i+1}",
    description: "This is the description for offer #{i+1}",
    price: rand(10.0..100.0).round(2),
    type_animal: ["Dog", "Cat", "Bird", "Fish", "Hamster"].sample,
    date_publication: Date.today - rand(0..30).days,
    user: user
  )
end

puts "Seed data created successfully"