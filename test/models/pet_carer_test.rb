require "test_helper"

class PetCarerTest < ActiveSupport::TestCase

  test "should belong to a user" do
    user = User.create(first_name: "User", address: "Porto, Portugal", email: "user@gmail.com")
    pet = Pet.create(name: "Dog", birth_date: Date.new(2022, 2, 28), address: "Porto, Portugal")
    pet_carer = PetCarer.create(user_id: user.id, pet_id: pet.id)

    assert_equal user.id, pet_carer.user_id
  end

  test "should belong to a pet" do
    user = User.create(first_name: "User", address: "Porto, Portugal", email: "user@gmail.com")
    pet = Pet.create(name: "Dog", birth_date: Date.new(2022, 2, 28), address: "Porto, Portugal")
    pet_carer = PetCarer.create(user_id: user.id, pet_id: pet.id)

    assert_equal pet.id, pet_carer.pet_id
  end


end
