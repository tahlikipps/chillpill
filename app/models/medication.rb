class Medication < ApplicationRecord
  belongs_to :pet
  has_many :medication_administrations
  MED_TYPE = ["Capsule", "Tablet", "Liquid", "Spray", "Cream", "Gel"]
  FREQUENCY = ["Everyday", "Every two days", "Every three days", "Once a week", "Twice a week"]
  # FREQUENCY_TIME = ["1 time(s) / day", "2 time(s) / day", "3 time(s) / day", "4 time(s) / day", "5 time(s) / day"]

  validates :name, :medication_type, :dosage, :frequency, :start_date, :end_date, :time_period, presence: true
end
