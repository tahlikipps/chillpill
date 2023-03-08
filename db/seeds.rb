# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

PetCarer.destroy_all
Medication.destroy_all
Pet.destroy_all
User.destroy_all

user1 = User.new(
  first_name: "Laia",
  last_name: "Martínez",
  phone_number: 344566767,
  address: Faker::Address.city,
  email: "Laia@gmail.com",
  password: "123456",
  is_vet: true
)
  file = URI.open("https://variety.com/wp-content/uploads/2022/09/funny-girl.jpg")
  user1.photo.attach(io: file, filename: "RSavatar.jpg", content_type: "image/jpeg")
user1.save!

  pet = Pet.new(
    name: "Blair",
    species: "dog",
    address: Faker::Address.city,
    birth_date: Date.new(2021, 1, 1)
  )
  pet.save!

  file = URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/golden-retriever-royalty-free-image-506756303-1560962726.jpg?crop=0.672xw:1.00xh;0.166xw,0&resize=640:*")
  pet.photo.attach(io: file, filename: "pet.jpg", content_type: "image/jpeg")
  pet.users << user1
  pet.save!

  medication = Medication.new(
    name: "Paracetamol",
    medication_type: "tablet",
    dosage: "2tablet",
    time_period: "2day",
    frequency: 2,
    start_date: Date.new(2022, 1, 3),
    end_date: Date.new(2022, 1, 5)
  )
  medication.pet= pet


  user2 = User.new(
    first_name: "Martin",
    last_name: "Gonzalez",
    phone_number: 344566767,
    address: Faker::Address.city,
    email: "Martin@gmail.com",
    password: "123456",
    is_vet: false
  )
    file = URI.open("https://variety.com/wp-content/uploads/2022/09/funny-girl.jpg")
    user2.photo.attach(io: file, filename: "RSavatar.jpg", content_type: "image/jpeg")
  user2.save!

    pet = Pet.new(
      name: "Catty",
      species: "cat",
      address: Faker::Address.city,
      birth_date: Date.new(2021, 5, 1)
    )
    pet.save!

    file = URI.open("https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/16:9/w_2560%2Cc_limit/1521-WIRED-Cat.jpeg")
    pet.photo.attach(io: file, filename: "pet.jpeg", content_type: "image/jpeg")
    pet.users << user1
    pet.save!

    medication = Medication.new(
      name: "Paracetamol",
      medication_type: "tablet",
      dosage: "2tablet",
      time_period: "2day",
      frequency: 2,
      start_date: Date.new(2022, 1, 3),
      end_date: Date.new(2022, 1, 5)
    )


    medication.pet= pet
    medication.save!
