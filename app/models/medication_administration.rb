class MedicationAdministration < ApplicationRecord
  belongs_to :medication
  belongs_to :user, optional: true

  validates :date, presence: true
end
