class ChangeMedicationAdministrationDate < ActiveRecord::Migration[7.0]
  def change
    change_column(:medication_administrations, :date, :datetime)
  end
end
