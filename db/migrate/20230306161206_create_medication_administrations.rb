class CreateMedicationAdministrations < ActiveRecord::Migration[7.0]
  def change
    create_table :medication_administrations do |t|
      t.date :date
      t.boolean :is_given
      t.references :medication, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
