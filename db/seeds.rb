# frozen_string_literal: true

require 'faker'
require 'httparty'
include ActionView::Helpers::AssetUrlHelper

# Supprimer les enregistrements des tables dépendantes
CartOffer.destroy_all
Pet.destroy_all
Category.destroy_all
Comment.destroy_all
Like.destroy_all
Offer.destroy_all
Order.destroy_all
Typeoffer.destroy_all
UserAddress.destroy_all
Address.destroy_all
AdminUser.destroy_all

# Supprimer les enregistrements principaux
ActiveAdmin::Comment.destroy_all
ActiveStorage::Attachment.destroy_all
ActiveStorage::Blob.destroy_all
ActiveStorage::VariantRecord.destroy_all
AdminUser.destroy_all
Cart.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('typeoffers')

# Définir un mot de passe commun pour tous les utilisateurs
common_password = 'password123'

User.create(email:"manon@test.com", password:"manontest", password_confirmation:"manontest", first_name:"Manon", last_name:"Esquerre",description: Faker::Lorem.paragraph(sentence_count: 3),
phone_number: "0000000000")

User.create(email:"thibault@test.com", password:"thibaulttest", password_confirmation:"thibaulttest", first_name:"Thibault", last_name:"Lenormand",description: Faker::Lorem.paragraph(sentence_count: 3),
phone_number: "0000000000")

User.create(email:"alexandre@test.com", password:"alexandretest", password_confirmation:"alexandretest", first_name:"Alexandre", last_name:"Tedesco",description: Faker::Lorem.paragraph(sentence_count: 3),
phone_number: "0000000000")

AdminUser.create!(email: 'admin@example.com', password: 'admin123', password_confirmation: 'admin123')

# Créer des utilisateurs avec un mot de passe commun
User.transaction do
  10.times do
    User.create!(
      email: Faker::Internet.email,
      password: common_password,
      password_confirmation: common_password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      phone_number: Faker::PhoneNumber.cell_phone.gsub(/\D/, '').slice(0..9)
    )
  end
end

# Créer des adresses
10.times do
  Address.create!(
    zip_code: Faker::Address.zip_code,
    city_name: Faker::Address.city,
    address_name: Faker::Address.street_address
  )
end

# Créer des typeoffers
['Adoption', 'Vente', 'Service'].each do |type_offer|
  Typeoffer.create!(
    type_offer: type_offer
  )
end

# Créer des catégories
categories = ['Chien', 'Chat', 'NAC']
categories.each do |category|
  Category.create!(
    type_animal: category
  )
end

images = []
i = 0
image_folder = Rails.root.join('app', 'assets', 'images', 'offers')

9.times do |image|
    image_path = image_folder.join("image_0#{i += 1}.jpg")
    images << image_path.to_s
end
i = 0
9.times do |image|
    image_path = image_folder.join("image_1#{i}.jpg")
    images << image_path.to_s
  i += 1
end


# Créer des offres
30.times do
  offer = Offer.create!(
    title: Faker::Lorem.words(number: 3).join(' '),
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: Faker::Commerce.price(range: 10.0..1000.0),
    type_animal: categories.sample,
    date_publication: Faker::Date.between(from: 1.year.ago, to: Date.today),
    user_id: User.pluck(:id).sample,
    type_offer_id: Typeoffer.pluck(:id).sample,
    price_type: ['Fixe', 'Horaire', 'Journalier'].sample
  )
  image_url = images.sample
  file = URI.open(image_url)
  offer.image.attach(io: file, filename: "#{offer.title}.jpg", content_type: 'image/jpg')
  puts "Created offer: #{offer.title}"
end

puts "Seed completed with users, addresses, typeoffers, categories, and offers"
