class MedicationAdministration < ApplicationRecord
  belongs_to :medication
  belongs_to :user

  validates :date, presence: true
end
