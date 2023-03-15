class UserPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    record == user || record.is_vet? || record.pets.any?{|e| e.in?(user.pets)}
  end

  # def edit?
  #   true
  # end

  # def update?
  #   true
  # end
end
