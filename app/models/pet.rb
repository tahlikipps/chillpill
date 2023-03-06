class Pet < ApplicationRecord
  has_many :medications
  SPECIES = ["dog", "cat", "turtle", "bird", "rabbit"]

  validate :name, :birth_date, :address, presence: true
  validate :species, inclusion: { in: SPECIES }
end
