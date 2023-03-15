class PetCarer < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  enum status: %i[pending confirmed rejected]
  after_create :create_chat

  private

  def create_chat
    Chat.create(pet: pet, vet: user, owner: pet.owner) if user.is_vet?
  end
end
