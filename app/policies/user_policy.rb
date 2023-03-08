class UserPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    record == user
  end


end
