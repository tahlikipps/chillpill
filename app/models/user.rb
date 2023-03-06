class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :pets, through: :pet_carers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :first_name, :address, presence: true
  validate :email, presence: true, uniqueness: true
end
