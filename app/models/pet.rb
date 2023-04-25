class Pet < ApplicationRecord
  has_one_attached :photo
  has_many :medications
  has_many :pet_carers
  has_many :users, through: :pet_carers
  SPECIES = ["Dog", "Cat", "Turtle", "Bird", "Rabbit"]

  validates :name, :birth_date, :address, presence: true
  validates :species, inclusion: { in: SPECIES }

  def owner
    owner = pet_carers.find{ |carer| carer.is_owner? }
    owner.user if owner
  end

  def vet
    vet = pet_carers.find{ |carer| carer.user.is_vet? }
    vet.user if vet
  end

  def pet_age
    Date.today.year - birth_date.year
  end
end
