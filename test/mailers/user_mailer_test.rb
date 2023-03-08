require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "medication_reminder" do
    mail = UserMailer.medication_reminder
    assert_equal "Medication reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
