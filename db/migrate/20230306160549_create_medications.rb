class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :medication_type
      t.string :dosage
      t.integer :frequency
      t.string :time_period
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
