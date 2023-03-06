class PetCarer < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  enum status: %i[pending confirmed rejected]
end
