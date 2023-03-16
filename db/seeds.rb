# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

puts "Destroying past seeds..."

Message.destroy_all
Chat.destroy_all
MedicationAdministration.destroy_all
PetCarer.destroy_all
Medication.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating new seeds..."

user1 = User.new(
  first_name: "Laia",
  last_name: "Martínez",
  bio: "Hello I am Laia and I really love my pets, they're the most beautiful things in the world.",
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
  species: 'Dog',
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

user3 = User.new(
  first_name: "Lola",
  last_name: "Ali",
  phone_number: "+344561347",
  address: "Carrer de Valencia, 120",
  email: "lola@gmail.com",
  password: "123456",
  is_vet: true
)
file = URI.open("https://images.unsplash.com/photo-1532714845903-d7b2a053e92b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=677&q=80")
user3.photo.attach(io: file, filename: "girl.jpg", content_type: "image/jpeg")

user3.save!

user4 = User.new(
  first_name: "Fatima",
  last_name: "Pashazade",
  phone_number: "+344561327",
  address: "Carrer de Vilamari",
  email: "fatima@gmail.com",
  password: "123456",
  is_vet: true
)
file = URI.open("https://images.unsplash.com/photo-1597214840472-aa1eaf0e1fac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80")
user4.photo.attach(io: file, filename: "girlly.jpg", content_type: "image/jpeg")

user4.save!

user5 = User.new(
  first_name: "Tahli",
  last_name: "Kipps",
  phone_number: "+344461327",
  address: "Carrer del Bruc, 149, Barcelona",
  email: "tahli.kipps@gmail.com",
  password: "123456",
  is_vet: false,
  created_at: DateTime.now-7.days,
  updated_at: DateTime.now-7.days

)
file = URI.open("https://avatars.githubusercontent.com/u/122308794?v=4")
user5.photo.attach(io: file, filename: "Tahli.png", content_type: "image/png")

user5.save!

pet5 = Pet.new(
  name: "Blair",
  species: 'Dog',
  address: "Carrer de Bruc 149, Barcelona",
  birth_date: Date.new(2022, 2, 28),
  created_at: DateTime.now-7.days,
  updated_at: DateTime.now-7.days
)
pet5.save!

file = File.open("app/assets/images/Blair.png")
pet5.photo.attach(io: file, filename: "blair.png", content_type: "image/png")
pet5.save!

medication = Medication.new(
  name: "Conofite",
  medication_type: "Liquid",
  dosage: "3 drops in & outside ear",
  time_period: "Daily",
  frequency: 2,
  start_date: Date.new(2023, 3, 9),
  end_date: Date.new(2022, 3, 20),
  created_at: DateTime.now-7.days

)
medication.pet = pet5
medication.save!


file = URI.open("https://images.unsplash.com/photo-1570805119976-20f93dfa781d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=929&q=80")
pet5.photo.attach(io: file, filename: "pet.jpg", content_type: "image/jpeg")
pet5.save!

PetCarer.create!(
  status: 1,
  pet: pet5,
  user: user5,
  is_owner: true
)

user6 = User.new(
  first_name: "Ryan",
  last_name: "Ebert",
  phone_number: "+344461327",
  address: "Carrer del Bruc, 149, Barcelona",
  email: "ryan@gmail.com",
  password: "123456",
  is_vet: false,
  created_at: DateTime.now-7.days,
  updated_at: DateTime.now-7.days
)
file = URI.open('https://media.licdn.com/dms/image/D4E03AQG8jNnnT-cVHQ/profile-displayphoto-shrink_400_400/0/1668670394925?e=1684368000&v=beta&t=P1t8g-DlyyiS7nnh6up9cN5kAzRZPIr3pQV79W-BLbo')
user6.photo.attach(io: file, filename: "Ryan.png", content_type: "image/png")

user6.save!

PetCarer.create!(
  status: 1,
  pet: pet5,
  user: user6,
  is_owner: false
)

PetCarer.create!(
  status: 1,
  pet: pet5,
  user: user2,
  is_owner: false
)


medicationadministration1 = MedicationAdministration.new(
  date: Date.new(2023, 3, 12),
  medication_id: medication.id,
  is_given: true,
  user_id: user6.id
)
medicationadministration1.save!


medicationadministration2 = MedicationAdministration.new(
  date: Date.new(2023, 3, 13),
  medication_id: medication.id,
  is_given: true,
  user_id: user5.id
)
medicationadministration2.save!

medicationadministration3 = MedicationAdministration.new(
  date: Date.new(2023, 3, 14),
  medication_id: medication.id,
  is_given: true,
  user_id: user5.id
)
medicationadministration3.save!

medicationadministration4 = MedicationAdministration.new(
  date: Date.new(2023, 3, 15),
  medication_id: medication.id,
  is_given: true,
  user_id: user5.id
)
medicationadministration4.save!

medicationadministration5 = MedicationAdministration.new(
  date: Date.new(2023, 3, 16),
  medication_id: medication.id,
)
medicationadministration5.save!

medicationadministration6 = MedicationAdministration.new(
  date: Date.new(2023, 3, 16),
  medication_id: medication.id,
)
medicationadministration6.save!

medicationadministration7 = MedicationAdministration.new(
  date: Date.new(2023, 3, 17),
  medication_id: medication.id,
)
medicationadministration7.save!

medicationadministration8 = MedicationAdministration.new(
  date: Date.new(2023, 3, 18),
  medication_id: medication.id,
)
medicationadministration8.save!

user8 = User.new(
  first_name: "Marta",
  last_name: "Garcia",
  phone_number: "+344361327",
  address: "Carrer de Bruc",
  email: "Marta@gmail.com",
  password: "123456",
  is_vet: true
)
file = URI.open("https://images.unsplash.com/photo-1609138271629-571665f418a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
user8.photo.attach(io: file, filename: "new.jpg", content_type: "image/jpeg")

user8.save!

user9 = User.new(
  first_name: "Claire",
  phone_number: "+344361327",
  address: "Barcelona",
  email: "claire@rover.com",
  password: "123456",
  is_vet: false
)
file = URI.open("https://images.unsplash.com/photo-1609138271629-571665f418a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
user9.photo.attach(io: file, filename: "new.jpg", content_type: "image/jpeg")

user9.save!

# pet = Pet.new(
#   name: "Catty",
#   species: "Cat",
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
