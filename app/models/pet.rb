class Pet < ApplicationRecord
  has_many :medications
  SPECIES = ["dog", "cat", "turtle", "bird", "rabbit"]

  validates :name, :birth_date, :address, presence: true
  validates :species, inclusion: { in: SPECIES }
end
