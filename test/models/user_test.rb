require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "should not save a user without a first name" do
    user = User.new(address: "Porto, Lisbon", email: "user@gmail.com")
    assert_not user.save, "Saved the user without a first name"
  end

  test "should not save a user without an address" do
    user = User.new(email: "user@gmail.com", first_name: "User")
    assert_not user.save, "Saved the user without an address"
  end

  test "should not save a user without an email" do
    user = User.new(address: "Porto, Lisbon", first_name: "User")
    assert_not user.save, "Saved the user without an emails"
  end

  test "should not allow a duplicate email address across users" do
    user1 = User.create(email: "user@gmail.com", first_name: "User")
    user2 = User.new(email: "user@gmail.com", first_name: "User")
    user1.save
    assert_not user2.save, "Saved a duplicate user name"
  end
end
