class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true
  # validates :content, length: { minimum: 1 }

  def sender?(a_user)
    user.id == a_user.id
  end
end
