class FixColumnInPetCarer < ActiveRecord::Migration[7.0]
  def change
    rename_column :pet_carers, :as_owner, :is_owner
  end
end
