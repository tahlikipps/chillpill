class PetCarerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
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
    record.user == user
  end

  def destroy?
    record.pet.owner == user || record.user == user
  end
end
