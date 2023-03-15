class AddStatusToMedication < ActiveRecord::Migration[7.0]
  def change
    add_column :medications, :status, :string, default: 'active', null: false
  end
end
