class ChangeMedicationAndPetRelation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pets, :medication, index: true, foreign_key: true
    add_reference :medications, :pet, index: true, foreign_key: true
  end
end
