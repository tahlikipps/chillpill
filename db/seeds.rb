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
  phone_number: "+344566467",
  address: "Carrer de Bruc 120, Barcelona",
  email: "Laia@gmail.com",
  password: "123456",
  is_vet: false
)
file = URI.open("https://images.unsplash.com/photo-1557495235-340eb888a9fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1413&q=80")
user1.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")
user1.save!

pet = Pet.new(
  name: "Love",
  species: 'dog',
  address: "Carrer de Bruc 120, Barcelona",
  birth_date: Date.new(2021, 1, 1)
)
pet.save!

file = URI.open("https://images.unsplash.com/photo-1570805119976-20f93dfa781d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=929&q=80")
pet.photo.attach(io: file, filename: "pet.jpg", content_type: "image/jpeg")
pet.save!

PetCarer.create!(
  status: 1,
  pet: pet,
  user: user1,
  is_owner: true
)

medication = Medication.new(
  name: "Paracetamol",
  medication_type: "tablet",
  dosage: "2tablet",
  time_period: "2day",
  frequency: 2,
  start_date: Date.new(2022, 1, 3),
  end_date: Date.new(2022, 1, 5)
)
medication.pet = pet

user2 = User.new(
  first_name: "Martin",
  last_name: "Gonzalez",
  phone_number: "+344561747",
  address: "Carrer de Provença, 120",
  email: "Martin@gmail.com",
  password: "123456",
  is_vet: true
)
file = URI.open("https://res.cloudinary.com/dktx1oojk/image/upload/f_auto,dpr_auto,q_60,fl_progressive/w_1.0,h_1.0,c_fill,g_auto/w_1080,h_720,c_scale/www2022/powerinit/35532/PRINT_AniCura_Care_and_meeting_376.jpeg")
user2.photo.attach(io: file, filename: "boy.jpg", content_type: "image/jpeg")

user2.save!

# pet = Pet.new(
#   name: "Catty",
#   species: "cat",
#   address: "Carrer de Provença, 120",
#   birth_date: Date.new(2021, 5, 1)
# )
# pet.save!

# file = URI.open("https://images.unsplash.com/photo-1553707256-eae873a0bcda?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80")
# pet.photo.attach(io: file, filename: "pet.jpeg", content_type: "image/jpeg")
# pet.users << user1
# pet.save!

# medication = Medication.new(
#   name: "Paracetamol",
#   medication_type: "tablet",
#   dosage: "2tablet",
#   time_period: "2day",
#   frequency: 2,
#   start_date: Date.new(2022, 1, 3),
#   end_date: Date.new(2022, 1, 5)
# )
# medication.pet = pet
# medication.save!
