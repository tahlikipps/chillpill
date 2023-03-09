class MedicationPolicy < ApplicationPolicy
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

  def update?
    true
  end
end
