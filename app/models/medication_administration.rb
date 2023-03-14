class MedicationAdministration < ApplicationRecord
  belongs_to :medication
  belongs_to :user, optional: true

  validates :date, presence: true

  after_create :scheduler_reminder_email

  private

  def scheduler_reminder_email
    UserMailer.with(user: self.medication.pet.owner)
              .medication_reminder
              .deliver_later!(wait_until: date - 15.minutes)
  end
end
