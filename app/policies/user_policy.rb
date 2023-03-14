class UserPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    record == user
  end

  # def edit?
  #   true
  # end

  # def update?
  #   true
  # end
end
