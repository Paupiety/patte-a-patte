# db/seeds.rb

# Clear existing data
User.destroy_all
Offer.destroy_all

# Create Users
10.times do |i|
  User.create!(
    email: "user#{i}@example.com",
    password: 'password',
    password_confirmation: 'password',
    first_name: "FirstName#{i}",
    last_name: "LastName#{i}",
    description: "Description for user #{i}"
  )
end

# Create Offers
User.all.each do |user|
  3.times do |i|
    Offer.create!(
      titre: "Offer #{i} for #{user.first_name}",
      description: "This is a description for offer #{i} by #{user.first_name}",
      prix: rand(10..100),
      type_animal: ["Cat", "Dog", "Bird"].sample,
      date_publication: Date.today,
      user: user
    )
  end
end

puts "Seed data created successfully!"
