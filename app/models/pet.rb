class Pet < ApplicationRecord
  has_one_attached :photo
  has_many :medications
  has_many :pet_carers
  has_many :users, through: :pet_carers
  SPECIES = ["dog", "cat", "turtle", "bird", "rabbit"]

  validates :name, :birth_date, :address, presence: true
  validates :species, inclusion: { in: SPECIES }

  def owner
    owner = pet_carers.find{ |carer| carer.is_owner? }
    owner.user if owner
  end
end
