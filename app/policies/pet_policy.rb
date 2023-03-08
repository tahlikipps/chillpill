class PetPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def show
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
