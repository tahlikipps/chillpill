class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :address
      t.string :name
      t.date :birth_date
      t.string :species

      t.timestamps
    end
  end
end
