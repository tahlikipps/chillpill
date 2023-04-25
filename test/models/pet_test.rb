require "test_helper"

class PetTest < ActiveSupport::TestCase

  test "pet age calculated correctly" do
    pet = Pet.new(name: "Dog", birth_date: Date.new(2022, 2, 28), address: "Porto, Portugal")
    assert_equal 1, pet.pet_age
  end

  test "should not save a pet without a name" do
    pet = Pet.new(birth_date: Date.new(2022, 2, 28), address: "Porto, Portugal")
    assert_not pet.save, "Saved the pet without a name"
  end

  test "should not save a pet without a birthdate" do
    pet = Pet.new(name: "Dog", address: "Porto, Portugal")
    assert_not pet.save, "Saved the pet without a birthdate"
  end

  test "should not save a pet without an address" do
    pet = Pet.new(name: "Dog", birth_date: Date.new(2022, 2, 28),)
    assert_not pet.save, "Saved the pet without an address"
  end

end
