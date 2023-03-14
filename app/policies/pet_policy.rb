class PetPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    true
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
    true
  end

  def destroy?
    true
  end
end
