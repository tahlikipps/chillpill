class Medication < ApplicationRecord
  has_many :medication_administrations
  validate :name, :medication_type, :dosage, :frequency, :start_date, :end_date, :time_period, presence: true
end
