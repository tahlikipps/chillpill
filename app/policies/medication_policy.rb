class MedicationPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def new?
    true
  end
end
