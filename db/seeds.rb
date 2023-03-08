# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PetCarer.destroy_all
Pet.destroy_all
User.destroy_all

leia = User.create!(first_name: "Leia", last_name:"Gracia", password:123456, address:"Carrer del Bruc 149 Barcelaon", phone_number:123456, email:"leia1@gmail.com")
blair = Pet.create!(name: "Blair", birth_date: "01/03/2022", address: "Carrer bruc", species: "dog")

PetCarer.create!(status: 1, is_owner: true, pet: blair, user: leia)
