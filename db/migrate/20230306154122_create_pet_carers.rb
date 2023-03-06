class CreatePetCarers < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_carers do |t|
      t.integer :status
      t.references :pet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :as_owner

      t.timestamps
    end
  end
end
