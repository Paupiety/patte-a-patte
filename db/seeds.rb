# db/seeds.rb

# Clear existing data
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Offer.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('offers')
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
Typeoffer.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('typeoffers')

type_animal_array = ["Cat", "Dog", "Bird", "Reptil", "Fish"]
index = 0
5.times do |t|
  Category.create!(
    type_animal: type_animal_array[index]
  )
  index += 1
end

  Typeoffer.create!(
    type_offer: "Service"
  )
  Typeoffer.create!(
    type_offer: "Adoption"
  )
  Typeoffer.create!(
    type_offer: "Vente"
  )

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
      title: "Offer #{i} for #{user.first_name}",
      description: "This is a description for offer #{i} by #{user.first_name}",
      price: rand(10..100),
      type_animal: ["Cat", "Dog", "Bird"].sample,
      date_publication: Date.today,
      user: user,
      type_offer: ["Vente", "Service", "Adoption"].sample
    )
  end
end

puts "Seed data created successfully!"
