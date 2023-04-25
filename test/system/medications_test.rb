require "application_system_test_case"

class MedicationsTest < ApplicationSystemTestCase
  test "checking the medication schedule dates in pet profile" do
     visit "/"

     click_on "or login to your account"

     login_as users(:Laia)

     visit "/profile"
     assert_selector "h2", text: "Laia Martínez"

     scroll_to('#div.profile-pets-container')

     assert_selector ".profile-petscard h3", text: "Love"

     click_on "Love"

     scroll_to('#a.yellow-btn')

     assert_selector ".yellow-btn", text: "Add medication"

     click_on "Add medication"

     fill_in "Medicine name", with: "Conofite"
     fill_in "Dosage", with: "Drops in and outside ear"
     select "Spray", from: "Type"
     select "Daily", from: "Time period"
     fill_in "Frequency", with: 2

     today = Date.today
     tomorrow = Date.today + 1
     find('#medication_start_date').set(today.strftime('%Y/%m/%d'))
     find('#medication_end_date').set(tomorrow.strftime('%Y/%m/%d'))

     click_on "Submit"


     ##assert_selector ".medicationstatus-card .text-small", text: "Sun 16"
    ##assert_selector ".medicationstatus-card img", src: "/assets/no-meds-ed54fcdad3e6897db21ebc74b0d9e10c542bec0e91bbf831994bd6f0f02dbaf5.png"
   end
end
